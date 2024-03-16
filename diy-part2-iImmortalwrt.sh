#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.24/g' package/base-files/files/bin/config_generate
sed -i 's/UTC/Asia/Shanghai/g' package/base-files/files/bin/config_generate

# 拉取软件包
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
git clone https://github.com/xrcuo/app-small.git package/app-small

# 删除重复包
rm -rf feeds/luci/themes/luci-theme-argon
#rm -rf feeds/luci/applications/luci-app-passwall
#rm -rf package/feeds/packages/naiveproxy
#rm -rf feeds/packages/net/naiveproxy

# 其他调整
sed -i 's#https://github.com/breakings/OpenWrt#https://github.com/xrcuo/Actions-OpenWrt-N1#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#ARMv8#x#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
sed -i 's#opt/kernel#kernel#g' package/luci-app-amlogic/luci-app-amlogic/root/etc/config/amlogic
