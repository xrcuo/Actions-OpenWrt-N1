#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.24/g' package/base-files/files/bin/config_generate
git clone https://github.com/kenzok8/small-package package/small-package
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

rm -rf package/small-package/luci-app-amlogic

sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/xrcuo/Actions-OpenWrt-N1#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#ARMv8#openwrt_armvirt_iStore#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
 
