TARGET_GAPPS_ARCH := arm64
include build/make/target/product/aosp_arm64.mk
$(call inherit-product, device/phh/treble/base.mk)

$(call inherit-product, device/phh/treble/lineage.mk)

PRODUCT_NAME := lineage_arm64_bvN
PRODUCT_DEVICE := arm64_bvN
PRODUCT_BRAND := google
PRODUCT_SYSTEM_BRAND := google
PRODUCT_MODEL := EverestOS Vanilla

WITH_GAPPS := false

TARGET_PREBUILT_PIXEL_LAUNCHER := false
TARGET_INCLUDE_PIXEL_LAUNCHER := false
TARGET_DEFAULT_PIXEL_LAUNCHER := false

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += \
  $(call subtract-product-packages, \
        $(PRODUCT_PACKAGES), \
        com.android.wallpaper) \

PRODUCT_PACKAGES += \
  WallpaperPickerGoogleRelease \
	