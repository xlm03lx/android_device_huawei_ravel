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

$(call inherit-product-if-exists, vendor/huawei/kirin970-common/kirin970-common-vendor.mk)

# Display Size
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Device init scripts
PRODUCT_PACKAGES += \
    init.hi6250.rc \
    init.hi6250.ab.rc \
    init.hi6250.environ.rc

# Display
PRODUCT_PACKAGES += \
    libion

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

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
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Release tools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/releasetools.hi6250.sh:install/bin/releasetools.hi6250.sh

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages \
    RemovePackages2

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk-compat/vndk-detect:system/bin/vndk-detect \
    $(LOCAL_PATH)/vndk-compat/ld.config.compat.txt:system/etc/ld.config.compat.txt \
    $(LOCAL_PATH)/vndk-compat/vndk-compat.rc:system/etc/init/vndk-compat.rc

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps_debug.conf


# Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media-codec-blacklist:system/etc/media-codec-blacklist \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Google Play
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/google.xml:system/etc/sysconfig/google.xml

# Speed-up stuff
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-filter=verify-none

# Hotword fix
PRODUCT_PACKAGES += \
    HotwordEnrollmentOKGoogleHI6403 \
    HotwordEnrollmentXGoogleHI6403

# NFC confs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:system/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# Sdcardfs
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sys.sdcardfs=0 \
    persist.sys.sdcardfs.emulated=0 \
    persist.sys.sdcardfs.public=0
