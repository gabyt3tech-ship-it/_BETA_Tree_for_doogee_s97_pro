#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/doogee/s97pro

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/doogee/s97pro/s97pro-vendor.mk)

$(call inherit-product, vendor/mediatek/opensource/mtk-builds.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    product \
    vendor \
    vbmeta \
    vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# API level (Android 11 = 30, ajuste conforme ROM base)
PRODUCT_SHIPPING_API_LEVEL := 30

# Audio configs
PRODUCT_COPY_FILES += \
    $(foreach file,$(wildcard $(DEVICE_PATH)/configs/audio/*), \
        $(file):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(file))) )

# Media codecs
PRODUCT_COPY_FILES += \
    $(foreach file,$(wildcard $(DEVICE_PATH)/configs/media/*), \
        $(file):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(file))) )

# Audio HALs (genérico MTK, ajuste se necessário)
PRODUCT_PACKAGES += \
    android.hardware.audio.service.mediatek \
    android.hardware.audio@6.0-impl-mediatek \
    audio.a2dp.default \
    audio.primary.default \
    audio.usb.default \
    audio.bluetooth.default \
    libtinycompress \
    libaudiofoundation.vendor

# SoundTrigger
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-service \
    android.hardware.boot@1.1-mtkimpl \
    android.hardware.boot@1.1-mtkimpl.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera (genérico MTK)
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4.vendor

# Properties
# Properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/props/system.prop:system/build.prop \
    $(LOCAL_PATH)/props/vendor.prop:vendor/build.prop \
    $(LOCAL_PATH)/props/product.prop:product/build.prop \
    $(LOCAL_PATH)/props/build_s97pro.prop:$(TARGET_COPY_OUT_SYSTEM)/etc/build_s97pro.prop


# Health / charger
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    libsuspend

# Display/Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack@1.0-service

# DRM
PRODUCT_PACKAGES += \
    recovery \
    fastbootd

# Gatekeeper / Keymaster
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.keymaster@3.0.vendor

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.s97pro

# Local time
PRODUCT_PACKAGES += \
    local_time.default

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/*.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/

# Networking
PRODUCT_PACKAGES += \
    libpcap.vendor

# NFC (remova se seu S97 Pro não tiver NFC)
PRODUCT_PACKAGES += \
    NfcNci \
    android.hardware.nfc@1.2-service.st

# Light (led/flash)
PRODUCT_PACKAGES += \
    android.hardware.lights-service.mediatek

# Init scripts
PRODUCT_PACKAGES += \
    init.mediatek.rc \
    init.mt6785.rc \
    fstab.mt6785 \
    vendor.ueventd.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6785:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6785

# Overlays (se tiver overlay custom pro S97 Pro)
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay-lineage

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service-lazy \
    hostapd \
    wpa_supplicant

# Fingerprint (ajuste conforme o sensor do S97 Pro, se for Goodix/FPC etc.)
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.s97pro

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

