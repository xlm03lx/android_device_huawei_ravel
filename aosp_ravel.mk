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

$(call inherit-product, device/huawei/ravel/full_ravel.mk)

# Inherit some common havoc stuff.
$(call inherit-product, vendor/havoc/config/common.mk)
$(call inherit-product, device/havoc/sepolicy/common/sepolicy.mk)
-include vendor/havoc/build/core/config.mk

# Inherit xlm03lx's Vendor
$(call inherit-product-if-exists, vendor/xlm03lx/xlm03lx.mk)

# Inherit decent  Vendor
$(call inherit-product-if-exists, vendor/support/common.mk)
$(call inherit-product-if-exists, vendor/themes/common.mk)

PRODUCT_NAME := aosp_ravel
PRODUCT_DEVICE := ravel
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Honor Note 10
PRODUCT_MANUFACTURER := Huawei

PRODUCT_GMS_CLIENTID_BASE := android-huawei

#Apps
PRODUCT_PACKAGES += \
    Camera2 \
    Gallery2 \
    FM \
    Calendar \
    DeskClock

# Disable dynamic partition size
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := false

WITHOUT_CHECK_API := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Fanthaghiro Foe"

TODAK_BUILD_TYPE := OFFICIAL
