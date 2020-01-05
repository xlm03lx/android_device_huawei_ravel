#!/usr/bin/env bash
#
# ROM patching script for P8 Lite 2017 (prague)
#
# Copyright (C) 2019 DarkJoker360<simoespo159@gmail.com>
#
# This program is free software: you can REDistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
source build/envsetup.sh

DEFAULT_URL="https://raw.githubusercontent.com/DarkJoker360/prague_patches/lineage-15.1"

cd build/core
echo "Patching build/core..."
wget $DEFAULT_URL/build/core/0001-Set-ro.build.fingerprint-in-system-etc-prop.default.patch
wget $DEFAULT_URL/build/core/0002-Shorten-build-id.patch
echo " "
patch -p1< 0001-Set-ro.build.fingerprint-in-system-etc-prop.default.patch
patch -p1< 0002-Shorten-build-id.patch
cd ../..

cd external/selinux
echo "Patching external/selinux..."
wget $DEFAULT_URL/external/selinux/0001-libsepol-cil-Keep-type-attribute-declarations-when.patch
wget $DEFAULT_URL/external/selinux/0002-libsepol-cil-Create-new-keep-field-for-type-attribut.patch
wget $DEFAULT_URL/external/selinux/0003-Enable-multipl_decls-by-default.-This-is-needed-beca.patch
wget $DEFAULT_URL/external/selinux/0004-Increase-default-log_level-to-get-actual-selinux-err.patch
echo " "
patch -p1< 0001-libsepol-cil-Keep-type-attribute-declarations-when.patch
patch -p1< 0002-libsepol-cil-Create-new-keep-field-for-type-attribut.patch
patch -p1< 0003-Enable-multipl_decls-by-default.-This-is-needed-beca.patch
patch -p1< 0004-Increase-default-log_level-to-get-actual-selinux-err.patch
cd ../..

cd frameworks/av
echo "Patching frameworks/av..."
wget $DEFAULT_URL/frameworks/av/0001-FIH-devices-Fix-Earpiece-audio-output.patch
wget $DEFAULT_URL/frameworks/av/0002-Huaweis-media-stack-doesn-t-handle-intra-refresh-mod.patch
echo " "
patch -p1< 0001-FIH-devices-Fix-Earpiece-audio-output.patch
patch -p1< 0002-Huaweis-media-stack-doesn-t-handle-intra-refresh-mod.patch
cd ..

cd base
echo "Patching frameworks/base..."
wget $DEFAULT_URL/frameworks/base/0001-renderthread-relax-error-handling-for-wide-gamut-EGL.patch
wget $DEFAULT_URL/frameworks/base/0002-Relax-requirement-for-visible-flag-to-sdcards.patch
wget $DEFAULT_URL/frameworks/base/0003-Also-scan-product-overlay-for-RRO.patch
wget $DEFAULT_URL/frameworks/base/0004-Also-scan-system-overlay.patch
wget $DEFAULT_URL/frameworks/base/0005-Don-t-crash-if-there-is-IR-HAL-is-not-declared.patch
wget $DEFAULT_URL/frameworks/base/0006-property-matching-RROs-allow-to-prefix-the-value-wit.patch
wget $DEFAULT_URL/frameworks/base/0007-Read-security-patches-from-another-prop.patch
echo " "
patch -p1< 0001-renderthread-relax-error-handling-for-wide-gamut-EGL.patch
patch -p1< 0002-Relax-requirement-for-visible-flag-to-sdcards.patch
patch -p1< 0003-Also-scan-product-overlay-for-RRO.patch
patch -p1< 0004-Also-scan-system-overlay.patch
patch -p1< 0005-Don-t-crash-if-there-is-IR-HAL-is-not-declared.patch
patch -p1< 0006-property-matching-RROs-allow-to-prefix-the-value-wit.patch
patch -p1< 0007-Read-security-patches-from-another-prop.patch
cd ..

cd native
echo "Patching frameworks/native..."
wget $DEFAULT_URL/frameworks/native/0001-Huawei-HWC-doesn-t-understand-0-0-0-0.patch
echo " "
patch -p1< 0001-Huawei-HWC-doesn-t-understand-0-0-0-0.patch
cd ..

cd opt/telephony
echo "Patching frameworks/opt/telephony..."
wget $DEFAULT_URL/frameworks/opt/telephony/0001-RIL-Allow-overriding-RadioResponse-and-RadioIndicati.patch
wget $DEFAULT_URL/frameworks/opt/telephony/0002-Telephony-Don-not-call-onUssdRelease-for-Huawei-RIL.patch
echo " "
patch -p1< 0001-RIL-Allow-overriding-RadioResponse-and-RadioIndicati.patch
patch -p1< 0002-Telephony-Don-not-call-onUssdRelease-for-Huawei-RIL.patch
cd ../../..

cd packages/apps/Camera2
echo "Patching packages/apps/Camera2..."
wget $DEFAULT_URL/packages/apps/Camera2/0001-Fix-flashlight-delay.patch
echo " "
patch -p1< 0001-Fix-flashlight-delay.patch
cd ../..

cd services/Telephony
echo "Patching packages/services/Telephony..."
wget $DEFAULT_URL/packages/services/Telephony/0001-Telephony-Support-muting-by-RIL-command.patch
echo " "
patch -p1< 0001-Telephony-Support-muting-by-RIL-command.patch
cd ../../..

cd system/bt
echo "Patching system/bt..."
wget $DEFAULT_URL/system/bt/0001-Make-BTM_BYPASS_EXTRA_ACL_SETUP-dynamic.patch
wget https://github.com/DarkJoker360/platform_system_bt/commit/b6b4b2af61d89f5ea54373f71abef73b2eb00c83.patch
echo " "
patch -p1< 0001-Make-BTM_BYPASS_EXTRA_ACL_SETUP-dynamic.patch
patch -p1< b6b4b2af61d89f5ea54373f71abef73b2eb00c83.patch
cd ..

cd core
echo "Patching system/core..."
wget $DEFAULT_URL/system/core/0001-Revert-logd-add-passcred-for-logdw-socket.patch
echo " "
patch -p1< 0001-Revert-logd-add-passcred-for-logdw-socket.patch
cd ..

cd libvintf
echo "Patching system/libvintf..."
wget $DEFAULT_URL/system/libvintf/0001-HACK-Support-sepolicy-vndk-26.patch
wget $DEFAULT_URL/system/libvintf/0002-Say-we-support-AVB-1.0.patch
echo " "
patch -p1< 0001-HACK-Support-sepolicy-vndk-26.patch
patch -p1< 0002-Say-we-support-AVB-1.0.patch
cd ..

cd netd
echo "Patching system/netd..."
wget $DEFAULT_URL/system/netd/0001-Huawei-Kirin-960-accept-broken-rpfilter-match.patch
echo " "
patch -p1< 0001-Huawei-Kirin-960-accept-broken-rpfilter-match.patch
cd ..

cd sepolicy
echo "Patching system/netd..."
wget $DEFAULT_URL/system/sepolicy/0001-add-file-contexts-for-exfat.patch
echo " "
patch -p1< 0001-add-file-contexts-for-exfat.patch
cd ..

cd vold
wget $DEFAULT_URL/system/vold/0001-Allow-deletion-of-symlink.patch
echo " "
patch -p1< 0001-Allow-deletion-of-symlink.patch
cd ../..

echo "Now you can build your rom !"
