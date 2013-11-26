#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(cal my-dir)

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM        := msm8960
TARGET_BOOTLOADER_BOARD_NAME := taurus
TARGET_BOOTLOADER_NAME       := taurus
TARGET_BOARD_INFO_FILE       := device/xiaomi/taurus/board-info.txt

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp -DQCOM_HARDWARE
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Architecture
TARGET_ARCH_VARIANT_CPU    := cortex-a9
TARGET_CPU_ABI             := armeabi-v7a
TARGET_CPU_ABI2            := armeabi
TARGET_CPU_SMP             := true
TARGET_CPU_VARIANT         := krait
TARGET_ARCH                := arm
TARGET_ARCH_VARIANT        := armv7-a-neon
BOARD_USES_QCOM_HARDWARE   := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET             := true
TARGET_KRAIT_BIONIC_PLDOFFS          := 10
TARGET_KRAIT_BIONIC_PLDTHRESH        := 10
TARGET_KRAIT_BIONIC_BBTHRESH         := 64
TARGET_KRAIT_BIONIC_PLDSIZE          := 64

BOARD_KERNEL_BASE      := 0x80200000
BOARD_KERNEL_PAGESIZE  := 2048
BOARD_KERNEL_CMDLINE   := console=ttyHSL0,115200,n8 androidboot.hardware=taurus ehci-hcd.park=3 maxcpus=2
BOARD_MKBOOTIMG_ARGS   := --ramdisk_offset 0x02000000

ifneq ($(BUILD_KERNEL),true)
TARGET_PREBUILT_KERNEL := device/xiaomi/taurus/kernel/kernel
else
TARGET_PREBUILT_KERNEL :=
endif

TARGET_RELEASETOOLS_EXTENSIONS := device/xiaomi/taurus

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_EGL_CFG := device/xiaomi/taurus/configs/egl.cfg

# FM
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED
QCOM_FM_ENABLED := true

TARGET_QCOM_MEDIA_VARIANT   := caf
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_AUDIO_VARIANT   := caf
TARGET_USES_QCOM_BSP        := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

#Display
TARGET_USES_ION             := true
USE_OPENGL_RENDERER         := true
TARGET_USES_C2D_COMPOSITION := true

# Use retire fence from MDP driver
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# Audio
BOARD_USES_ALSA_AUDIO                   := true
TARGET_USES_QCOM_MM_AUDIO               := true
TARGET_USES_QCOM_COMPRESSED_AUDIO       := true
BOARD_HAVE_LOW_LATENCY_AUDIO            := true
BOARD_AUDIO_EXPECTS_MIN_BUFFERSIZE      := true
BOARD_USES_SEPERATED_VOICE_SPEAKER      := true
BOARD_AUDIO_CAF_LEGACY_INPUT_BUFFERSIZE := true
BOARD_USES_LEGACY_ALSA_AUDIO            := true

# GPS
BOARD_HAVE_NEW_QC_GPS := true
#The below will be needed if we ever want to build GPS HAL from source
#TARGET_PROVIDES_GPS_LOC_API := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#TARGET_NO_RPC := true

# Camera
COMMON_GLOBAL_CFLAGS       += -DMR0_CAMERA_BLOB -DDISABLE_HW_ID_MATCH_CHECK -DQCOM_BSP_CAMERA_ABI_HACK -DQCOM_BSP

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
BLUETOOTH_HCI_USE_MCT                       := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xiaomi/taurus/bluetooth

# Webkit
ENABLE_WEBGL            := true
TARGET_FORCE_CPU_UPLOAD := true

# Recovery
TARGET_RECOVERY_FSTAB            := device/xiaomi/taurus/configs/fstab.taurus
RECOVERY_FSTAB_VERSION           := 2
TARGET_RECOVERY_PIXEL_FORMAT     := "RGBX_8888"
BOARD_CUSTOM_GRAPHICS            := ../../../device/xiaomi/taurus/recovery/graphics_en.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/xiaomi/taurus/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT   := \"roboto_15x24.h\"
BOARD_HAS_NO_SELECT_BUTTON       := true

TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 373293056
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 8388608
BOARD_CACHEIMAGE_PARTITION_SIZE    := 402653184
BOARD_FLASH_BLOCK_SIZE             := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_SECURE_SERVICES := true

BOARD_LIB_DUMPSTATE := libdumpstate.taurus

-include vendor/xiaomi/taurus/BoardConfigVendor.mk

BOARD_SEPOLICY_DIRS += \
    device/xiaomi/taurus/sepolicy

BOARD_SEPOLICY_UNION := \
       app.te \
       bluetooth.te \
       compatibility.te \
       device.te \
       domain.te \
       drmserver.te \
       file.te \
       file_contexts \
       hci_init.te \
       healthd.te \
       init_shell.te \
       keystore.te \
       mediaserver.te \
       netd.te \
       kickstart.te \
       rild.te \
       surfaceflinger.te \
       system.te \
       ueventd.te \
       wpa.te

USE_DEVICE_SPECIFIC_CAMERA:= true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY:= true

HAVE_ADRENO_SOURCE:= false
