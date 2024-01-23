#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),ivan)

$(call add-radio-file,releasetools/dynamic-remove-oplus)

include $(call all-makefiles-under,$(LOCAL_PATH))
endif
