#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openconnect
PKG_VERSION:=9.12
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.infradead.org/openconnect/download
PKG_HASH:=a2bedce3aa4dfe75e36e407e48e8e8bc91d46def5335ac9564fbf91bd4b2413e

PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING.LGPL

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/openconnect
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libxml2 +kmod-tun +libgnutls +libtasn1
  TITLE:=OpenConnect VPN client
  MAINTAINER:=Nikos Mavrogiannopoulos <n.mavrogiannopoulos@gmail.com>
  URL:=https://www.infradead.org/openconnect/
  SUBMENU:=VPN
endef

define Package/openconnect/description
	A VPN client compatible with several SSL VPN implementations (ocserv)
endef

CONFIGURE_ARGS += \
	--disable-shared \
	--disable-vhost-net \
	--with-vpnc-script=/lib/netifd/vpnc-script \
	--without-libpcsclite \
	--without-stoken \
	--without-libpskc \
	--without-gssapi \
	--without-lz4 \
	--with-gnutls

define Package/openconnect/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openconnect $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,openconnect))
