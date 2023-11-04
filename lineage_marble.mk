#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Source
TARGET_ROM_SOURCE := lineage

# Inherit some common vendor stuff.
ifeq ($(TARGET_ROM_SOURCE),lineage)
$(call inherit-product, vendor/$(TARGET_ROM_SOURCE)/config/common_full_phone.mk)
endif
$(call inherit-product-if-exists, vendor/$(TARGET_ROM_SOURCE)/config.mk)

# Inherit from marble device.
$(call inherit-product, device/xiaomi/marble/marble.mk)

## Device identifier
PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := marble
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := $(TARGET_ROM_SOURCE)_marble

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
