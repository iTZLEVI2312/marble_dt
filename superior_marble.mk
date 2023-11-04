#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Source
TARGET_ROM_SOURCE := superior

# Inherit some common vendor stuff.
ifeq ($(TARGET_ROM_SOURCE),lineage)
$(call inherit-product, vendor/$(TARGET_ROM_SOURCE)/config/common_full_phone.mk)
endif
$(call inherit-product-if-exists, vendor/$(TARGET_ROM_SOURCE)/config.mk)

# Inherit from marble device.
$(call inherit-product, device/xiaomi/marble/marble.mk)

# Blur
TARGET_SUPPORTS_BLUR := true
ifeq ($(TARGET_SUPPORTS_BLUR),true)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1 \
    persist.sys.sf.disable_blurs=1
endif

TARGET_FACE_UNLOCK_SUPPORTED := true
BOARD_USES_QCOM_HARDWARE := true

# MIUI Camera
TARGET_BUILD_MIUICAM := true

ifeq ($(TARGET_BUILD_MIUICAM),true)
$(call inherit-product-if-exists, vendor/xiaomi/camera/miuicamera.mk)

PRODUCT_SYSTEM_PROPERTIES += \
    ro.miui.notch=1 \
    ro.product.mod_device=marble_global
endif

## Device identifier
PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := marble
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := $(TARGET_ROM_SOURCE)_marble

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
