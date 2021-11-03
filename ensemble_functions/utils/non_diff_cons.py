import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
from skimage.morphology import flood_fill
from torch import Tensor

from ensemble_functions.utils.independent_functions import average_list

device = 'cpu'


# samples and probability map
def prob_sample(preds: Tensor):
    # multinomial sampling
    n, c, h, w = preds.shape
    c_views = preds.view(n, c, h * w)
    c_reviews = c_views.transpose(2, 1)

    # sampling 10 times for each image and save into a list
    for i_dx in range(10):
        img_list = []
        for n_img in c_reviews:
            # try:
            view_index = torch.multinomial(n_img, 1)
            # except:
            #     print('nan values:', torch.sum(torch.isnan(n_img)).item())
            img_list.append(view_index)

        # transfer a list into a n channel tensor
        for i in range(len(img_list)):
            if i == 0:
                view_indexes = img_list[i].unsqueeze(0)
            else:
                one_img = img_list[i]
                view_indexes = torch.cat([view_indexes, one_img.unsqueeze(0)])

        back_index = view_indexes.transpose(2, 1)
        sample_index = back_index.view(n, h, w)

        # probability map and reward
        prob = torch.zeros_like(preds[:, 0, :, :])
        for i in range(preds.shape[1]):
            mask_c = torch.where(sample_index == i, torch.Tensor([1]).to(device), torch.Tensor([0]).to(device))
            prob = prob + mask_c * preds[:, i, :, :]

        if i_dx == 0:
            prob_ns = prob.unsqueeze(1)
            sample_ns = sample_index.unsqueeze(1)
        else:
            prob_ns = torch.cat([prob_ns, prob.unsqueeze(1)], dim=1)
            sample_ns = torch.cat([sample_ns, sample_index.unsqueeze(1)], dim=1)
    return prob_ns, sample_ns  # [n,c,h,w] n: the number of images c: number of samples


# rewards
def cons_rewards(samples, fg_num, Fscale, Cscale, run_state='train', reward_type='binary', my_connectivity=None):
    kernel = torch.ones(1, 1, Fscale, Fscale)
    kernel = torch.FloatTensor(kernel)
    weight = nn.Parameter(data=kernel, requires_grad=False).to(device)

    patch = torch.ones(1, 1, Cscale, Cscale)
    patch = torch.FloatTensor(patch)
    patch_weight = nn.Parameter(data=patch, requires_grad=False).to(device)

    counter = 0
    C_rewards = torch.Tensor(fg_num - 1) * 0
    for per_img in samples:  # samples:[n_imgs, c_samples, h, w]
        fg_conn_full = torch.zeros_like(per_img.unsqueeze(1))
        for class_idx in range(1, fg_num):
            fg = torch.where(per_img == class_idx, torch.Tensor([1]).to(device), torch.Tensor([0]).to(device))
            count_neighbor = F.conv2d(fg.unsqueeze(1).float(), weight, padding=int((Fscale - 1) / 2))
            fg_neighbors = (count_neighbor * fg.unsqueeze(1)).transpose(1, 0)
            if fg_neighbors.max() > 0:
                m = [torch.where(fg_neighbors.squeeze(0)[i] == fg_neighbors.squeeze(0)[i].max()) for i in
                     range(per_img.shape[0])]
                for per_s in range(fg.shape[0]):  # each sample for one image
                    max_index = np.random.randint(m[per_s][0].__len__())
                    if per_s == 0:
                        fill_connect = torch.Tensor(flood_fill(fg[per_s].cpu().numpy(),
                                                               (m[per_s][0][max_index].cpu().numpy(),
                                                                m[per_s][1][max_index].cpu().numpy()),
                                                               (fg_neighbors.max() + 1).cpu().numpy(),
                                                               connectivity=None if my_connectivity =='None' else my_connectivity)).unsqueeze(
                            0).unsqueeze(0)
                    else:
                        fill_connect_img = torch.Tensor(flood_fill(fg[per_s].cpu().numpy(),
                                                                   (m[per_s][0][max_index].cpu().numpy(),
                                                                    m[per_s][1][max_index].cpu().numpy()),
                                                                   (fg_neighbors.max() + 1).cpu().numpy(),
                                                                   connectivity=None if my_connectivity =='None' else my_connectivity))
                        fill_connect = torch.cat([fill_connect, fill_connect_img.unsqueeze(0).unsqueeze(0)], dim=1)

                fill_connect = torch.where(fill_connect.to(device) == fg_neighbors.max() + 1,
                                           torch.Tensor([1]).to(device), torch.Tensor([0]).to(device)).transpose(1, 0)
            else:
                fill_connect = torch.zeros_like(fg_conn_full).float()

            if run_state == 'train':
                F_constraint = F.conv2d(fill_connect, patch_weight, padding=int((Cscale - 1) / 2))
                F_fg_neigbors = F_constraint * fill_connect

                S_constraint = F.conv2d(fg.unsqueeze(1).float(), patch_weight, padding=int((Cscale - 1) / 2))
                S_fg_neigbors = S_constraint * fg.unsqueeze(1)

                fc_nonzerobg = torch.where(F_fg_neigbors.float() == 0, torch.Tensor([-1]).to(device),
                                           F_fg_neigbors.float())
                sc_nonzerobg = torch.where(S_fg_neigbors.float() == 0, torch.Tensor([-2]).to(device),
                                           S_fg_neigbors.float())
                if reward_type == 'binary':
                    per_c_rewards = (fc_nonzerobg == sc_nonzerobg).float().transpose(1, 0)
                elif reward_type == 'discretecontinuous':
                    S_fg_neigbors1 = torch.where(S_fg_neigbors.float() == 0, torch.Tensor([1]).to(device),
                                S_fg_neigbors.float())
                    per_c_rewards = (F_fg_neigbors / S_fg_neigbors1).transpose(1,0)
                elif reward_type == 'center_area':  # high reward for center pixel
                    reward_temp = (fc_nonzerobg == sc_nonzerobg).float().transpose(1, 0)
                    per_c_rewards = F_fg_neigbors.transpose(1, 0) * reward_temp
                elif reward_type == 'boundary_line':  # high reward for boundary
                    reward_temp = (fc_nonzerobg == sc_nonzerobg).float().transpose(1, 0)
                    per_c_rewards_reverse = patch_weight.sum() - F_fg_neigbors
                    per_c_rewards = per_c_rewards_reverse.transpose(1, 0) * reward_temp
                else:
                    f_conn_pixels_num = torch.Tensor([fill_connect[i].sum() for i in range(fill_connect.shape[0])]).to(
                        device)
                    s_pixels_num = torch.Tensor([fg.unsqueeze(1)[i].sum() for i in range(fg.unsqueeze(1).shape[0])]).to(
                        device)
                    reward_ratio = f_conn_pixels_num / s_pixels_num
                    fill_connect_tmp = (
                                fill_connect.view(fill_connect.shape[2] * fill_connect.shape[3], fill_connect.shape[0])
                                * reward_ratio).t()
                    per_c_rewards = fill_connect_tmp.view(fill_connect.shape[0], fill_connect.shape[1],
                                                          fill_connect.shape[2], fill_connect.shape[3])
                    per_c_rewards = per_c_rewards.transpose(1, 0)
            else:
                per_c_rewards = fill_connect

            if class_idx == 1:
                C_reward = per_c_rewards
            else:
                C_reward = C_reward + per_c_rewards

        if counter == 0:
            C_rewards = C_reward
            counter += 1
        else:
            C_rewards = torch.cat([C_rewards, C_reward])
    return C_rewards


# segmentation mask and probability
def val_prediction(prob: Tensor, target: Tensor):
    # max sample distribution
    sample = prob.max(1)[1]
    # for reducing the computational complexity
    sample_list = []
    count = prob.shape[0]  # the number of images
    for img in range(prob.shape[0]):
        if target[img].sum() == 0:
            count = count - 1
        else:
            sample_list.append(sample[img])
    if len(sample_list) == 0:
        sample_imgs = 'Null'
    elif len(sample_list) == 1:
        sample_imgs = sample_list[0].unsqueeze(0).unsqueeze(0)
    else:
        for i in range(len(sample_list) - 1):
            if i == 0:
                sample_imgs = torch.cat(
                    [sample_list[i].unsqueeze(0).unsqueeze(0), sample_list[i + 1].unsqueeze(0).unsqueeze(0)], dim=1)
            else:
                sample_imgs = torch.cat([sample_imgs, sample_list[i + 1].unsqueeze(0).unsqueeze(0)], dim=1)
    return sample_imgs


class Report_reward(nn.Module):
    def __init__(self, Fscale=5, Cscale=3, run_state='val', my_connectivity=None):
        super().__init__()
        self.Fscale = Fscale
        self.Cscale = Cscale
        self._run_state = run_state
        self._my_connectivity = my_connectivity

    def forward(self, prob: Tensor, target: Tensor, **kwargs) -> Tensor:
        sample_imgs = val_prediction(prob, target)
        if sample_imgs == "Null":
            C_reward = 1
        else:
            fg_num = prob.shape[1]  # fg_num: the number of classes
            C_rewards = cons_rewards(sample_imgs.transpose(1, 0), fg_num, Fscale=self.Fscale, Cscale=self.Cscale,
                                     run_state=self._run_state, my_connectivity=self._my_connectivity)

            avgc_reward_list = []
            for i in range(sample_imgs.shape[1]):
                for class_idx in range(1, fg_num):
                    fg = torch.where(sample_imgs.squeeze(0)[i] == class_idx, torch.Tensor([1]).to(device),
                                     torch.Tensor([0]).to(device))
                    fg_c = C_rewards[i] * fg.unsqueeze(0)
                    if fg.sum() == 0:
                        c_reward = 1
                    else:
                        c_reward = 1 - fg_c.sum() / fg.sum()
                    if class_idx == 1:
                        save_c_rewards = torch.Tensor([c_reward])
                    else:
                        save_c_rewards = torch.cat([save_c_rewards, torch.Tensor([c_reward])], dim=0)
                avgc_reward_list.append(save_c_rewards)

            C_reward = average_list(avgc_reward_list)
        return C_reward


# reinforced constraint loss
class reinforce_cons_loss(nn.Module):
    def __init__(self, num_sample=10, Fscale=5, Cscale=3, run_state='train', reward_type='binary', rein_baseline=False, my_connectivity=None):
        super().__init__()
        self._num = num_sample
        self._Fscale = Fscale
        self._Cscale = Cscale
        self._run_state = run_state
        self._reward_type = reward_type
        self.rein_baseline = rein_baseline
        self._my_connectivity = my_connectivity

    def forward(self, prob: Tensor, **kwargs) -> Tensor:
        probs, samples = prob_sample(prob)
        fg_num = prob.shape[1]  # fg_num: the number of classes
        C_rewards = cons_rewards(samples, fg_num, self._Fscale, self._Cscale, self._run_state, self._reward_type, self._my_connectivity)
        assert probs.shape == C_rewards.shape
        if self.rein_baseline:
            avg_reward = ((1 / C_rewards.shape[1]) * C_rewards.sum(dim=1)).unsqueeze(1)
            cons_loss = (- (C_rewards - avg_reward) * torch.log(probs + 1e-6)).mean()
        else:
            cons_loss = (- C_rewards * torch.log(probs + 1e-6)).mean()
        return cons_loss



