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
#

# NFC config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/treble_common.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/legacy_gsi_common.mk)
#include build/make/target/product/aosp_arm64_ab.mk

# Inherit from berkeley device
$(call inherit-product, device/huawei/ravel/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ravel
PRODUCT_NAME := full_ravel
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Honor Note 10

PRODUCT_SHIPPING_API_LEVEL := 26

PRODUCT_ARTIFACT_PATH_REQUIREMENT_WHITELIST += \
    system/etc/init/init.legacy-gsi.rc \
    system/etc/init/gsi/init.vndk-27.rc \
    system/etc/ld.config.vndk_lite.txt \

# Legacy GSI support addtional O-MR1 interface
PRODUCT_EXTRA_VNDK_VERSIONS += 27

# Support for the O-MR1 devices
PRODUCT_COPY_FILES += \
    build/make/target/product/gsi/init.legacy-gsi.rc:system/etc/init/init.legacy-gsi.rc \
    build/make/target/product/gsi/init.vndk-27.rc:system/etc/init/gsi/init.vndk-27.rc

# Name space configuration file for non-enforcing VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt

# Legacy GSI relax the compatible property checking
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := false

PRODUCT_ARTIFACT_PATH_REQUIREMENT_WHITELIST += \
    root/init.zygote32_64.rc \
    root/init.zygote64_32.rc \

PRODUCT_COPY_FILES += \
    system/core/rootdir/init.zygote32_64.rc:root/init.zygote32_64.rc
