import torch
from torch import Tensor
import numpy as np
import cv2

from ensemble_functions.utils.independent_functions import average_list

device = 'cuda'

def convexity_descriptor(x: Tensor, cons_types='convex_hull'):
    b, c, h, w = x.shape
    hull_rewards = torch.randn(1,c,h,w).to(device)
    defects_rewards = torch.randn(1,c,h,w).to(device)
    pseudo_like_FG_rewards = torch.randn(1,c,h,w).to(device)
    pseudo_like_BG_rewards = torch.randn(1,c,h,w).to(device)
    reverse_FGBG_rewards = torch.randn(1,c,h,w).to(device)

    for sample in range(b):
        non_conv, convex_hull, convex_contour = metric_convexity(x[sample])
        hull_rewards = torch.cat([hull_rewards, convex_contour-(convex_hull - convex_contour).unsqueeze(0)], dim=0)
        defects_rewards = torch.cat([defects_rewards, -(convex_hull - convex_contour).unsqueeze(0)], dim=0)
        pseudo_like_FG_rewards = torch.cat([pseudo_like_FG_rewards, convex_hull.unsqueeze(0)], dim=0)
        pseudo_like_BG_rewards = torch.cat([pseudo_like_BG_rewards, (-convex_hull).unsqueeze(0)], dim=0)
        reverse_FGBG_rewards = torch.cat([reverse_FGBG_rewards, ((convex_hull - convex_contour)-convex_contour).unsqueeze(0)], dim=0)

    hull_rewards = hull_rewards[1:11, :, :, :]
    defects_rewards = defects_rewards[1:11, :, :, :]
    pseudo_like_FG_rewards = pseudo_like_FG_rewards[1:11, :, :, :]
    pseudo_like_BG_rewards = pseudo_like_BG_rewards[1:11, :, :, :]
    reverse_FGBG_rewards = reverse_FGBG_rewards[1:11, :, :, :]

    if cons_types == 'convex_hull':
        return hull_rewards
    elif cons_types == 'defects':
        return defects_rewards
    elif cons_types == "pseudo_like_FG":
        return pseudo_like_FG_rewards
    elif cons_types == "pseudo_like_BG":
        return pseudo_like_BG_rewards
    elif cons_types == "reverse_FGBG":
        return reverse_FGBG_rewards


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
            hull = cv2.convexHull(cnt_max)

            cv2.fillConvexPoly(convex_contour, cnt_max, (255, 0, 255))
            convex_contour = (torch.Tensor(convex_contour) / 255).to(device)

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

