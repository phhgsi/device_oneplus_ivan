# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1


# hardware
git clone https://github.com/oneplus-mt6877/android_hardware_mediatek.git -b lineage-20 hardware/mediatek

# oplus
git clone https://github.com/LineageOS/android_hardware_oplus.git -b lineage-20 hardware/oplus

#clang
git clone https://github.com/oneplus-mt6877/android_prebuilts_clang_host_linux-x86_clang-6443078.git -b 11.0.1 prebuilts/clang/host/linux-x86/clang-r383902

# sepolicy
git clone https://github.com/PQEnablers-Devices/android_device_mediatek_sepolicy_vndr.git -b lineage-20 device/mediatek/sepolicy_vndr
