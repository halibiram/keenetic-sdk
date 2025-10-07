#
# Copyright (C) 2024 Jules
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=v2ray
PKG_VERSION:=1.8.4
PKG_RELEASE:=1

PKG_MAINTAINER:=Jules
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/v2ray
  TITLE:=V2Ray client with full Web UI
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=VPN
  URL:=https://github.com/v2fly/v2ray-core
  DEPENDS:=+kmod-tun +iptables +ip-full +kmod-nfqueue +iptables-mod-conntrack-extra +libopenssl +libndm
endef

define Package/v2ray/description
 A V2Ray client with native Keenetic UI integration, supporting multiple protocols and DPI bypass.
endef

# This is a pre-compiled package, so we don't have a build section.
# We will just copy files.

define Build/Prepare
endef

define Build/Compile
endef

define Package/v2ray/install
	# This will copy all files from our local 'files' directory to the package installation root
	$(CP) ./files/* $(1)/
endef

define Package/v2ray/conffiles
/opt/etc/v2ray/config.json
/opt/etc/v2ray/servers.json
/opt/etc/v2ray/rules.json
/opt/etc/v2ray/dpi-rules.conf
endef

$(eval $(call BuildPackage,v2ray))