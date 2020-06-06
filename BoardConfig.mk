#
# Copyright (C) 2018 The LineageOS Project
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

include build/make/target/board/generic_arm64_ab/BoardConfig.mk

DEVICE_PATH := device/huawei/ravel

# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := /dev/null
BOARD_AVB_ENABLE := false

# Camera
TARGET_CAMERA_NEEDS_ADD_STATES_IN_ENUMERATE := true

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := exfat

# System themes
TARGET_RRO_OUT_SYSTEM := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2080000U

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3707764736
BOARD_CACHEIMAGE_PARTITION_SIZE := 16777216

# Properties
TARGET_SYSTEM_PROP := $(VENDOR_PATH)/system.prop

# Recovery
#BOARD_PROVIDES_BOOTLOADER_MESSAGE := true
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/rootdir/etc/fstab.kirin970

# Assert
TARGET_OTA_ASSERT_DEVICE := ravel,kirin970
SELINUX_IGNORE_NEVERALLOWS := true

# Boot SPL
BOOT_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Vendor SPL
VENDOR_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Boot animation
TARGET_SCREEN_HEIGHT := 2220
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

# NFC config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# vintf
DEVICE_FRAMEWORK_MANIFEST_FILE := $(VENDOR_PATH)/framework_manifest.xml
