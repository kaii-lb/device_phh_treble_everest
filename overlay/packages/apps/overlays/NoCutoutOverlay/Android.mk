LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_RRO_THEME := DisplayCutoutNoCutout
LOCAL_CERTIFICATE := platform

LOCAL_SRC_FILES := $(call all-subdir-java-files)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

# patch by "Christopher A. Williamson" <home@chrisaw.com>
# Move NoCutoutOverlay to /product - selinux context fix
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/overlay

LOCAL_PACKAGE_NAME := NoCutoutOverlay
LOCAL_SDK_VERSION := current

LOCAL_IS_RUNTIME_RESOURCE_OVERLAY := true
include $(BUILD_PACKAGE)
