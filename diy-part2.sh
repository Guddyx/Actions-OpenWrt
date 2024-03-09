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
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 移除要替换的包
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/utils/v2dat

# 更新golang
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

# 添加luci-app-mosdns
git clone https://github.com/sbwml/luci-app-mosdns.git mosdns
cp -rf mosdns/luci-app-mosdns feeds/luci/applications/luci-app-mosdns
cp -rf mosdns/luci-app-mosdns/v2dat feeds/packages/utils/v2dat
rm -rf mosdns

