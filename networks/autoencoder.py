import torch
import torch.nn as nn
import torch.nn.functional as F


class ConvAE(nn.Module):
    def __init__(self, channel, num_classes=1, latent_num=512):
        super(ConvAE, self).__init__()
        self.conv1 = nn.Conv2d(channel, 64, kernel_size=5, stride=2, padding=2)  # 4 32 32
        self.bn1 = nn.BatchNorm2d(64)
        self.relu = nn.ReLU(inplace=True)

        self.conv2 = nn.Conv2d(64, 128, kernel_size=5, stride=2, padding=2)  # 2, 16, 16
        self.bn2 = nn.BatchNorm2d(128)
        self.conv3 = nn.Conv2d(128, 128, kernel_size=5, stride=1, padding=2)  # 2, 16, 16
        self.bn3 = nn.BatchNorm2d(128)
        self.conv4 = nn.Conv2d(128, 256, kernel_size=5, stride=2, padding=2)  # 1, 8, 8
        self.bn4 = nn.BatchNorm2d(256)

        self.fc1 = nn.Linear(256 * 24 * 24, latent_num)
        self.fc2 = nn.Linear(latent_num, 256 * 24 * 24)

        self.conv5 = nn.Conv2d(256, 128, kernel_size=5, stride=1, padding=2)
        self.bn5 = nn.BatchNorm2d(128)

        self.conv6 = nn.Conv2d(128, 128, kernel_size=5, stride=1, padding=2)
        self.bn6 = nn.BatchNorm2d(128)

        self.conv7 = nn.Conv2d(128, 64, kernel_size=5, stride=1, padding=2)
        self.bn7 = nn.BatchNorm2d(64)

        self.conv8 = nn.Conv2d(64, num_classes, kernel_size=5, stride=1, padding=2)

    def forward(self, x):
        n, c, h, w = x.shape
        x = self.relu(self.bn1(self.conv1(x)))
        x = self.relu(self.bn2(self.conv2(x)))
        x = self.relu(self.bn3(self.conv3(x)))
        x = self.relu(self.bn4(self.conv4(x)))

        x = x.view(n, -1)
        code = self.fc1(x)

        x = self.fc2(code)
        x = x.view(n, 256, 24, 24)

        x = self.relu(x)
        x = F.interpolate(x, scale_factor=2, mode='bilinear', align_corners=True)
        x = self.relu(self.bn5(self.conv5(x)))

        x1 = self.relu(self.bn6(self.conv6(x)))
        x = F.interpolate(x1, scale_factor=2, mode='bilinear', align_corners=True)
        x2 = self.relu(self.bn7(self.conv7(x)))
        x = F.interpolate(x2, scale_factor=2, mode='bilinear', align_corners=True)
        x = self.conv8(x)
        x = F.sigmoid(x)

        return x, code



