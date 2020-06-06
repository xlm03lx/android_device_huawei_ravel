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

# Inherit from kirin970-common
$(call inherit-product, device/huawei/ravel/BoardConfig.mk)

$(call inherit-product-if-exists, vendor/huawei/kirin970-common/kirin970-common-vendor.mk)

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/apns-full-conf.xml:system/etc/apns-conf.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Device init scripts
PRODUCT_PACKAGES += \
    init.bcm43xx.rc \
    init.hisi.rc \
    init.kirin970.rc \
    init.kirin970.ab.rc \
    init.kirin970.environ.rc

# Display
PRODUCT_PACKAGES += \
    libion

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input fingerprint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.huawei1=8.1.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null \
    ro.vendor.override.security_patch=$(PLATFORM_SECURITY_PATCH) \
    ro.vendor.override.build_display=$(BUILD_ID)

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# Fix Offline Charging on Huawmeme
PRODUCT_PACKAGES += \
	huawei-charger
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,$(LOCAL_PATH)/huawei_charger/files,system/etc/charger)

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Release tools
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/releasetools/kirin970-on-boot.sh:system/bin/kirin970-on-boot.sh \
	$(LOCAL_PATH)/releasetools/kirin970-on-data.sh:system/bin/kirin970-on-data.sh \
	$(LOCAL_PATH)/releasetools/kirin970-prop-handler.sh:system/bin/kirin970-prop-handler.sh

# Selinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
	$(LOCAL_PATH)/sepolicy

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.kirin970

#VNDK config files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vndk/vndk-detect:system/bin/vndk-detect \
	$(LOCAL_PATH)/vndk/vndk.rc:system/etc/init/vndk.rc \
	$(LOCAL_PATH)/vndk/ld.config.26.txt:system/etc/ld.config.26.txt

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi@1.2
