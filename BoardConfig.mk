#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/ivan

# APEX
ALLOW_MISSING_DEPENDENCIES=true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := ivan,IV2201,OP555BL1,IV2201,IV2201EEA

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a78

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Boot Image
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_DTB_OFFSET := 0x07c08000

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.tee_type=2
#BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board ""

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ivan
TARGET_NO_BOOTLOADER := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //hardware/oplus:libudfps_extension.oplus

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/oneplus/ivan
TARGET_KERNEL_CONFIG := ivan_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r383902
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Display
TARGET_SCREEN_DENSITY := 480

# Manifest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/framework_compatibility_matrix.xml
BOARD_USES_METADATA_PARTITION := true

# partition
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
ifneq ($(WITH_GMS),true)
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1073741824
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1073741824
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 536870912
else
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 52428800
endif
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 52428800

BOARD_DYNAMIC_PARTITIONS_FILESYSTEM ?= ext4

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := $(BOARD_DYNAMIC_PARTITIONS_FILESYSTEM)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := $(BOARD_DYNAMIC_PARTITIONS_FILESYSTEM)
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := $(BOARD_DYNAMIC_PARTITIONS_FILESYSTEM)
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := $(BOARD_DYNAMIC_PARTITIONS_FILESYSTEM)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := $(BOARD_DYNAMIC_PARTITIONS_FILESYSTEM)

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# Partitions (Dynamic)
BOARD_SUPER_PARTITION_SIZE := 6979321856
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 6975127552 # ( BOARD_SUPER_PARTITION_SIZE - 4MB )
BOARD_MAIN_PARTITION_LIST := system product vendor odm system_ext

# Platform
TARGET_BOARD_PLATFORM := mt6877
BOARD_HAS_MTK_HARDWARE := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6877
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
include device/mediatek/sepolicy_vndr/SEPolicy.mk

# SPL
VENDOR_SECURITY_PATCH := 2023-12-01

# Touch
SOONG_CONFIG_NAMESPACES += OPLUS_LINEAGE_TOUCH_HAL
SOONG_CONFIG_OPLUS_LINEAGE_TOUCH_HAL := INCLUDE_DIR
SOONG_CONFIG_OPLUS_LINEAGE_TOUCH_HAL_INCLUDE_DIR := $(COMMON_PATH)/touch/include

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current

# Wi-Fi
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

# Inherit the proprietary files
include vendor/oneplus/ivan/BoardConfigVendor.mk
