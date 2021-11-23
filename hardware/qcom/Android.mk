ifneq ($(wildcard device/oneplus/msm8998-common/hardware/qcom/custom.mk),)
    include device/oneplus/msm8998-common/hardware/qcom/custom.mk
else
# Board platforms lists to be used for
# TARGET_BOARD_PLATFORM specific featurization
QCOM_BOARD_PLATFORMS += msm8952 msm8996 msm8998 sdm660 sdm845 sm6125 sm8150 sm8250

# Some supported platforms need a different media hal
# This list selects platforms that should use the latest media hal
# All other platforms automatically fallback to the legacy hal
QCOM_NEW_MEDIA_PLATFORM := sdm845 sm6125 sm8150 sm8250

#List of targets that use video hw
MSM_VIDC_TARGET_LIST := msm8952 msm8996 msm8998 sdm660 sdm845 sm6125 sm8150 sm8250

#List of targets that use master side content protection
MASTER_SIDE_CP_TARGET_LIST := msm8996 msm8998 sdm660 sdm845 sm6125 sm8150 sm8250

QCOM_MEDIA_ROOT := hardware/qcom/media/

OMX_VIDEO_PATH := mm-video-v4l2

SRC_CAMERA_HAL_DIR := vendor/qcom/opensource/camera
SRC_DISPLAY_HAL_DIR := vendor/qcom/opensource/display
SRC_MEDIA_HAL_DIR := $(QCOM_MEDIA_ROOT)
TARGET_KERNEL_VERSION := 4.14

include device/oneplus/msm8998-common/hardware/qcom/utils.mk

ifeq ($(TARGET_USES_AOSP_AUDIO_HAL),true)
audio-hal := hardware/qcom/audio
include $(call all-makefiles-under,$(audio-hal))
endif

endif
