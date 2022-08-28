import torch
import torch.nn as nn
import torch.nn.functional as F
import numpy as np
from skimage.morphology import flood_fill
from torch import Tensor
import cv2
from ensemble_functions.utils.independent_functions import average_list, plot_seg, plot_feature

device = 'cuda'

# samples and probability map
def prob_sample(preds: Tensor, reverse_indicator=False):
    # multinomial sampling
    n, c, h, w = preds.shape
    c_views = preds.view(n, c, h * w)
    c_reviews = c_views.transpose(2, 1)

    # sampling 10 times for each image and save into a list
    prob_ns, sample_ns = [], []
    for i_dx in range(10):
        img_list = []
        for n_img in c_reviews:
            view_index = torch.multinomial(n_img, 1)
            img_list.append(view_index)

        # transfer a list into a n channel tensor
        view_indexes = []
        for i in range(len(img_list)):
            if i == 0:
                view_indexes = img_list[i].unsqueeze(0)
            else:
                one_img = img_list[i]
                view_indexes = torch.cat([view_indexes, one_img.unsqueeze(0)])

        back_index = view_indexes.transpose(2, 1)
        sample_index = back_index.view(n, h, w).to(device)

        # probability map and reward
        prob = torch.zeros_like(preds[:, 0, :, :]).to(device)
        for i in range(preds.shape[1]):
            mask_c = torch.where(sample_index == i, torch.Tensor([1]).to(device), torch.Tensor([0]).to(device))
            prob = prob + mask_c * preds[:, i, :, :]

        if reverse_indicator:
            rein_prob = 1- prob
        else:
            rein_prob = prob

        if i_dx == 0:
            prob_ns = rein_prob.unsqueeze(1)
            sample_ns = sample_index.unsqueeze(1)
        else:
            prob_ns = torch.cat([prob_ns, rein_prob.unsqueeze(1)], dim=1)
            sample_ns = torch.cat([sample_ns, sample_index.unsqueeze(1)], dim=1)
    return prob_ns, sample_ns  # [n,c,h,w] n: the number of images c: number of samples

# connectivity rewards
def connectivity_rewards(samples, fg_num, Fscale, Cscale, reward_type='hard', my_connectivity=None, run_state='train'):
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
                if reward_type == 'hard':
                    per_c_rewards_tmp = (fc_nonzerobg == sc_nonzerobg).float().transpose(1, 0)
                    per_c_rewards = (fg - per_c_rewards_tmp) - per_c_rewards_tmp

                elif reward_type == 'soft':
                    S_fg_neigbors1 = torch.where(S_fg_neigbors.float() == 0, torch.Tensor([1]).to(device),
                                S_fg_neigbors.float())
                    per_c_rewards_tmp = -(F_fg_neigbors / S_fg_neigbors1).transpose(1,0)

                    sub_per_c_rewards = (fc_nonzerobg == sc_nonzerobg).float().transpose(1, 0)
                    per_c_rewards = (fg - sub_per_c_rewards) + per_c_rewards_tmp

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

# convexity reward
def convexity_descriptor(x: Tensor, reward_type='hard'):
    b, c, h, w = x.shape
    hard_rewards = torch.randn(1,c,h,w).to(device)
    soft_rewards = torch.randn(1,c,h,w).to(device)

    for sample in range(b):
        non_conv, convex_hull, fg_contour = metric_convexity(x[sample])
        defects = (convex_hull - fg_contour) + 1
        rewards = torch.where(defects == 2, torch.tensor([0.0]).to(device), defects)
        hard_rewards = torch.cat([hard_rewards, rewards.unsqueeze(0)], dim=0)
        #todo conv / k^2
        kernel = torch.ones(1, 1, 3, 3)
        kernel = torch.FloatTensor(kernel).to(device)
        rewards_soft = F.conv2d(rewards.unsqueeze(0).transpose(1,0), kernel, padding=int((3 - 1) / 2)).transpose(1,0) * rewards.unsqueeze(0)
        soft_rewards = torch.cat([soft_rewards, rewards_soft / 9], dim=0)

    hard_rewards = hard_rewards[1:11, :, :, :]
    soft_rewards = soft_rewards[1:11, :, :, :]

    if reward_type == 'hard':
        return hard_rewards
    elif reward_type == "soft":
        return soft_rewards

# convexity metric
def metric_convexity(x: Tensor):
    for i in range(x.shape[0]):
        contours, hierarchy = cv2.findContours(x[i].squeeze(0).cpu().numpy().astype(dtype=np.uint8), 0, 1)
        regions = []
        for c in contours:
            regions.append(cv2.contourArea(c))

        convex_contour = (torch.zeros_like(x[i].squeeze(0))).cpu().numpy().astype(dtype=np.float32)
        convex_hull = (torch.zeros_like(x[i].squeeze(0))).cpu().numpy().astype(dtype=np.float32)
        try:
            cnt_max = contours[np.argsort(-np.array(regions))[0]]
            max_id = np.argsort(-np.array(regions))[0]

            hull = cv2.convexHull(cnt_max)

            # cv2.fillConvexPoly(convex_contour, cnt_max, (255, 0, 255))
            convex_contour = cv2.drawContours(convex_contour, contours, max_id, 1, cv2.FILLED)

            convex_contour = (torch.Tensor(convex_contour)).to(device)

            cv2.fillConvexPoly(convex_hull, hull, (255, 0, 255))
            convex_hull = (torch.Tensor(convex_hull) / 255).to(device)
        except:
            print('no contour and no hull.')

        if type(convex_contour) is np.ndarray:
            convex_contour = torch.Tensor(convex_contour).to(device)
            convex_hull = torch.Tensor(convex_hull).to(device)

        if i == 0:
            convex_contours = convex_contour.unsqueeze(0)
            convex_hulls = convex_hull.unsqueeze(0)
        else:
            convex_contours = torch.cat([convex_contours, convex_contour.unsqueeze(0)], 0)
            convex_hulls = torch.cat([convex_hulls, convex_hull.unsqueeze(0)], 0)


    non_conv_region = convex_hulls - convex_contours
    non_convs = []
    for k in range(non_conv_region.shape[0]):
        if non_conv_region[k].sum() == 0:
            non_conv = 0
        else:
            non_conv = torch.true_divide(non_conv_region[k].sum(), convex_hulls[k].sum())
        non_convs.append(non_conv)
    return average_list(non_convs), convex_hulls, convex_contours

# segmentation mask and probability
def max_segmentation(prob: Tensor, target: Tensor):
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

class metric_connectivity(nn.Module):
    def __init__(self, Fscale=5, Cscale=3, run_state='val', my_connectivity=None):
        super().__init__()
        self.Fscale = Fscale
        self.Cscale = Cscale
        self._my_connectivity = my_connectivity
        self._run_state = run_state

    def forward(self, prob: Tensor, target: Tensor, **kwargs) -> Tensor:
        sample_imgs = max_segmentation(prob, target)
        if sample_imgs == "Null":
            non_conn = 1
        else:
            fg_num = prob.shape[1]  # fg_num: the number of classes
            C_rewards = connectivity_rewards(sample_imgs.transpose(1, 0), fg_num, Fscale=self.Fscale, Cscale=self.Cscale,
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

            non_conn = average_list(avgc_reward_list)
        return non_conn

# reinforced constraint loss
class reinforce_cons_loss(nn.Module):
    def __init__(self, num_sample=10, constraint='connectivity', Fscale=5, Cscale=3, reward_type='hard', reverse_indicator=False,
                 my_connectivity=None, run_state='train'):
        super().__init__()
        self._num = num_sample
        self._constraint = constraint
        self._Fscale = Fscale
        self._Cscale = Cscale
        self._reward_type = reward_type
        self.reverse = reverse_indicator
        self._my_connectivity = my_connectivity
        self._run_state = run_state

    def forward(self, prob: Tensor, unlab_filename, cur_epoch, cur_batch, writer, **kwargs) -> Tensor:
        probs, samples = prob_sample(prob, reverse_indicator=self.reverse)

        if self._constraint == "connectivity":
            fg_num = prob.shape[1]  # fg_num: the number of classes
            C_rewards = connectivity_rewards(samples=samples, fg_num=fg_num, Fscale=self._Fscale, Cscale=self._Cscale,
                                             reward_type=self._reward_type, my_connectivity=self._my_connectivity, run_state=self._run_state)
        elif self._constraint == "convexity":
            samples = samples.transpose(1, 0)
            C_rewards = convexity_descriptor(samples, reward_type=self._reward_type)
            C_rewards = C_rewards.transpose(1, 0)
        assert probs.shape == C_rewards.shape
        #todo: save probs, samples, and rewards(C_rewards)
        assert probs.shape == samples.shape == C_rewards.shape

        if cur_batch == 0:
            samples1 = plot_seg(unlab_filename[-1], samples[-1][0])
            samples2 = plot_seg(unlab_filename[-1], samples[-1][1])
            samples3 = plot_seg(unlab_filename[-1], samples[-1][2])
            writer.add_figure(tag=f"train_samples1", figure=samples1, global_step=cur_epoch, close=True)
            writer.add_figure(tag=f"train_samples2", figure=samples2, global_step=cur_epoch, close=True)
            writer.add_figure(tag=f"train_samples3", figure=samples3, global_step=cur_epoch, close=True)

            probs1 = plot_seg(unlab_filename[-1], probs[-1][0])
            probs2 = plot_seg(unlab_filename[-1], probs[-1][1])
            probs3 = plot_seg(unlab_filename[-1], probs[-1][2])
            writer.add_figure(tag=f"probs1", figure=probs1, global_step=cur_epoch, close=True)
            writer.add_figure(tag=f"probs2", figure=probs2, global_step=cur_epoch, close=True)
            writer.add_figure(tag=f"probs3", figure=probs3, global_step=cur_epoch, close=True)

            rewards_samp1 = plot_seg(unlab_filename[-1], C_rewards[-1][0])
            rewards_samp2 = plot_seg(unlab_filename[-1], C_rewards[-1][1])
            rewards_samp3 = plot_seg(unlab_filename[-1], C_rewards[-1][2])
            writer.add_figure(tag=f"rewards_samp1", figure=rewards_samp1, global_step=cur_epoch, close=True)
            writer.add_figure(tag=f"rewards_samp2", figure=rewards_samp2, global_step=cur_epoch, close=True)
            writer.add_figure(tag=f"rewards_samp3", figure=rewards_samp3, global_step=cur_epoch, close=True)

        # avg_reward = ((1 / C_rewards.transpose(1, 0).shape[1]) * C_rewards.transpose(1, 0).sum(dim=1)).unsqueeze(1)
        avg_reward = 0.5
        cons_loss = ((C_rewards - avg_reward) * torch.log(probs + 1e-6)).mean()

        return cons_loss

