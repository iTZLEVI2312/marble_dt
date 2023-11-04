#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/$(TARGET_ROM_SOURCE)_marble.mk

COMMON_LUNCH_CHOICES := \
    $(TARGET_ROM_SOURCE)_marble-eng \
    $(TARGET_ROM_SOURCE)_marble-userdebug \
    $(TARGET_ROM_SOURCE)_marble-user
