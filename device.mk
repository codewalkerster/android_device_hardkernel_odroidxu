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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/hardkernel/odroidxu/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

include $(LOCAL_PATH)/BoardConfig.mk

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/conf/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/conf/vold.fstab.sdboot:system/etc/vold.fstab.sdboot

# Init files
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/conf/init.odroidxu.rc:root/init.odroidxu.rc \
	device/hardkernel/odroidxu/conf/init.odroidxu.usb.rc:root/init.odroidxu.usb.rc \
	device/hardkernel/odroidxu/conf/fstab.odroidxu:root/fstab.odroidxu \
	device/hardkernel/odroidxu/conf/fstab.odroidxu.sdboot:root/fstab.odroidxu.sdboot

PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/conf/ueventd.odroidxu.rc:root/ueventd.odroidxu.rc

# Generated kcm keymaps
PRODUCT_PACKAGES := \
	odroid-keypad.kcm

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# audio
PRODUCT_PACKAGES += \
	audio.primary.odroidxu \
	audio.a2dp.default \
	audio.usb.default

# audio mixer paths
PRODUCT_COPY_FILES += \
	device/samsung/smdk_common/audio/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES += \
	camera.$(TARGET_BOOTLOADER_BOARD_NAME)

# Libs
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Video Editor
PRODUCT_PACKAGES += \
	VideoEditorGoogle

# Misc other modules
PRODUCT_PACKAGES += \
	lights.odroidxu

# gps
PRODUCT_PACKAGES += \
	gps.odroidxu

# Custom Update packages
PRODUCT_PACKAGES += \
    OdroidUpdater \
	Utility

PRODUCT_PACKAGES += \
    Superuser \
    su


# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/media_profiles.xml:system/etc/media_profiles.xml \
	device/hardkernel/odroidxu/media_codecs.xml:system/etc/media_codecs.xml

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/hardkernel/proprietary/bin/odroid-ts.idc:system/usr/idc/odroidxu-ts.idc \
	device/hardkernel/proprietary/bin/odroid-ts.kl:system/usr/keylayout/odroidxu-ts.kl \
	device/hardkernel/proprietary/bin/odroid-ts.kcm:system/usr/keylayout/odroidxu-ts.kcm \
	device/hardkernel/proprietary/bin/odroid-keypad.kl:system/usr/keylayout/odroidxu-keypad.kl \
	device/hardkernel/proprietary/bin/odroid-keypad.kcm:system/usr/keychars/odroidxu-keypad.kcm

# for USB HID MULTITOUCH
PRODUCT_COPY_FILES += \
	device/hardkernel/proprietary/bin/Vendor_03fc_Product_05d8.idc:system/usr/idc/Vendor_03fc_Product_05d8.idc \
	device/hardkernel/proprietary/bin/Vendor_1870_Product_0119.idc:system/usr/idc/Vendor_1870_Product_0119.idc \
	device/hardkernel/proprietary/bin/Vendor_1870_Product_0119.idc:system/usr/idc/Vendor_1870_Product_0100.idc \
	device/hardkernel/proprietary/bin/Vendor_1870_Product_0119.idc:system/usr/idc/Vendor_2808_Product_81c9.idc
	
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

#
# USB Ethernet Module
#
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/drivers/smsc95xx.ko:system/lib/modules/smsc95xx.ko \
	device/hardkernel/odroidxu/drivers/ax88179_178a.ko:system/lib/modules/ax88179_178a.ko

#
# WIFI firmware & Module
#
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/drivers/rtl8191su.ko:system/lib/modules/rtl8191su.ko \
	device/hardkernel/odroidxu/drivers/rtl8192cu.ko:system/lib/modules/rtl8192cu.ko

#
# sound card Module
#
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/drivers/snd-usb-audio.ko:system/lib/modules/snd-usb-audio.ko \
	device/hardkernel/odroidxu/drivers/snd-usbmidi-lib.ko:system/lib/modules/snd-usbmidi-lib.ko


PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.no_hw_vsync=1 \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15
	
# XBox 360 Controller kl keymaps
PRODUCT_COPY_FILES += \
	device/hardkernel/proprietary/bin/Vendor_045e_Product_0291.kl:system/usr/keylayout/Vendor_045e_Product_0291.kl \
	device/hardkernel/proprietary/bin/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
	device/hardkernel/proprietary/bin/Vendor_045e_Product_0719.kcm:system/usr/keychars/Vendor_045e_Product_0719.kcm

PRODUCT_COPY_FILES += \
	device/hardkernel/proprietary/apk/Ultra_Explorer.apk:system/app/Ultra_Explorer.apk \
	device/hardkernel/proprietary/apk/jackpal.androidterm.apk:system/app/jackpal.androidterm.apk \
	device/hardkernel/proprietary/lib/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

PRODUCT_COPY_FILES += \
	device/hardkernel/proprietary/apk/DicePlayer.apk:system/app/DicePlayer.apk \
	device/hardkernel/proprietary/lib/libSoundTouch.so:system/lib/libSoundTouch.so \
	device/hardkernel/proprietary/lib/libdice_jb.so:system/lib/libdice_jb.so \
	device/hardkernel/proprietary/lib/libdice_jb2.so:system/lib/libdice_jb2.so \
	device/hardkernel/proprietary/lib/libdice_loadlibrary.so:system/lib/libdice_loadlibrary.so \
	device/hardkernel/proprietary/lib/libdice_software.so:system/lib/libdice_software.so \
	device/hardkernel/proprietary/lib/libdice_software_jb.so:system/lib/libdice_software_jb.so \
	device/hardkernel/proprietary/lib/libffmpeg_dice.so:system/lib/libffmpeg_dice.so \
	device/hardkernel/proprietary/lib/libsonic.so:system/lib/libsonic.so

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=160

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage \
    ro.kernel.android.checkjni=0

# WQXGA_LCD
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi

PRODUCT_CHARACTERISTICS := tablet

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product-if-exists, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5410/exynos5410-vendor.mk)
