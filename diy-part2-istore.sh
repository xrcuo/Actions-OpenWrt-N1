#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.24/g' package/base-files/files/bin/config_generate

# 拉取软件包
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-theme-argon
git clone https://github.com/kenzok8/small-package package/small-package
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

# 删除重复包
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf package/small-package/luci-app-amlogic
rm -rf package/small-package/luci-theme-argon*
rm -rf package/small-package/luci-app-argon*
rm -rf package/small-package/luci-app-argon-config*
rm -rf package/small-package/luci-app-argone-config*

# 其他调整
sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/xrcuo/Actions-OpenWrt-N1#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#ARMv8#openwrt_armvirt_iStore#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
