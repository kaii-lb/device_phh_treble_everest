TARGET_GAPPS_ARCH := arm64
include build/make/target/product/aosp_arm64.mk
$(call inherit-product, device/phh/treble/base.mk)

# $(call inherit-product, device/phh/treble/gapps.mk) # removed cuz it doesn't actually inherit anything lmfao
$(call inherit-product, device/phh/treble/everest.mk)

PRODUCT_NAME := lineage_arm64_bgN
PRODUCT_DEVICE := arm64_bgN
PRODUCT_BRAND := google
PRODUCT_SYSTEM_BRAND := google
PRODUCT_MODEL := EverestOS with GApps

# Gapps things
WITH_GAPPS := true

TARGET_DEFAULT_PIXEL_LAUNCHER := false

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

PRODUCT_PACKAGES += 
