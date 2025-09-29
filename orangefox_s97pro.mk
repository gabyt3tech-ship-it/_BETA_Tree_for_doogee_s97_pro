#
# Orange Fox Product Makefile for Doogee S97 Pro
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(DEVICE_PATH)/device.mk)

PRODUCT_DEVICE := s97pro
PRODUCT_NAME := orangefox_s97pro
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := S97 Pro
PRODUCT_MANUFACTURER := DOOGEE

# Shipping API level (Android 11 → 30, já definido no device.mk, mas reforçamos aqui se quiser)
PRODUCT_SHIPPING_API_LEVEL := 30

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    system \
    product \
    vendor

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

