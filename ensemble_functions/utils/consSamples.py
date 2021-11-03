from torch import Tensor
import torch

device='cpu'
def prob_sample(preds: Tensor, cons_types="convex_hull"):
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
        sample_index = back_index.view(n, h, w).to(device)

        # probability map
        prob = torch.zeros_like(preds[:, 0, :, :]).to(device)
        if cons_types == "convex_hull" or cons_types == "defects":
            for i in range(preds.shape[1]):
                mask_c = torch.where(sample_index == i, torch.Tensor([1]).to(device), torch.Tensor([0]).to(device))
                prob = prob + mask_c * preds[:, i, :, :]
        elif cons_types == "pseudo_like_FG":
            prob = preds[:, 1, :, :]
        elif cons_types == "pseudo_like_BG":
            prob = preds[:, 0, :, :]
        elif cons_types == "reverse_FGBG":
            for i in range(preds.shape[1]):
                mask_c = torch.where(sample_index == i, torch.Tensor([0]).to(device), torch.Tensor([1]).to(device))
                prob = prob + mask_c * preds[:, i, :, :]

        if i_dx == 0:
            prob_ns = prob.unsqueeze(1)
            sample_ns = sample_index.unsqueeze(1)
        else:
            prob_ns = torch.cat([prob_ns, prob.unsqueeze(1)], dim=1)
            sample_ns = torch.cat([sample_ns, sample_index.unsqueeze(1)], dim=1)
    return prob_ns, sample_ns  # [n,c,h,w] n: the number of images c: number of samples
