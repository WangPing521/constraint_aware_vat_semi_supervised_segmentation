import PIL

from datasets.augmentation import pil_augment
from datasets.augmentation.sychronized_augment import SequentialWrapper

image_transform = pil_augment.Compose(
    [
        pil_augment.RandomCrop((192, 192), fill=(0,)),
        pil_augment.RandomRotation(degrees=0, resample=PIL.Image.BILINEAR),
        pil_augment.RandomChoice(
            [pil_augment.RandomVerticalFlip(), pil_augment.RandomHorizontalFlip()]
        ),
        pil_augment.ToTensor(),
    ]
)
label_transform = pil_augment.Compose(
    [
        pil_augment.RandomCrop((192, 192), fill=(0,)),
        pil_augment.RandomRotation(degrees=0, resample=PIL.Image.NEAREST),
        pil_augment.RandomChoice(
            [pil_augment.RandomVerticalFlip(), pil_augment.RandomHorizontalFlip()]
        ),
        pil_augment.ToLabel(),
    ]
)

val_img_transform = pil_augment.Compose(
    [pil_augment.CenterCrop((192, 192),), pil_augment.ToTensor()]
)
val_target_transform = pil_augment.Compose(
    [pil_augment.CenterCrop((192, 192),), pil_augment.ToLabel()]
)


train_transform = SequentialWrapper(
    image_transform, label_transform, if_is_target=[False, True]
)
val_transform = SequentialWrapper(
    val_img_transform, val_target_transform, if_is_target=[False, True]
)
