import PIL

from deepclustering2.augment import pil_augment, SequentialWrapper

image_transform = pil_augment.Compose(
    [
        pil_augment.Resize((256, 256)),
        pil_augment.RandomRotation(degrees=10, resample=PIL.Image.BILINEAR),
        pil_augment.RandomChoice(
            [pil_augment.RandomVerticalFlip(), pil_augment.RandomHorizontalFlip()]
        ),
        pil_augment.ToTensor(),
    ]
)
label_transform = pil_augment.Compose(
    [
        pil_augment.Resize((256, 256)),
        pil_augment.RandomRotation(degrees=10, resample=PIL.Image.NEAREST),
        pil_augment.RandomChoice(
            [pil_augment.RandomVerticalFlip(), pil_augment.RandomHorizontalFlip()]
        ),
        pil_augment.ToLabel(),
    ]
)
val_img_transform = pil_augment.Compose(

    [pil_augment.Resize((256, 256)), pil_augment.ToTensor()]
)
val_target_transform = pil_augment.Compose(
    [pil_augment.Resize((256, 256)), pil_augment.ToLabel()]
)


train_transform_resize = SequentialWrapper(
    image_transform, label_transform, if_is_target=[False, True]
)
val_transform_resize = SequentialWrapper(
    val_img_transform, val_target_transform, if_is_target=[False, True]
)
