#
# Copyright (C) 2023 Keenetic User
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/package.mk

PKG_NAME:=openvpn-sni-bypass
PKG_VERSION:=1.1
PKG_RELEASE:=1
PKG_ARCH:=all

PKG_MAINTAINER:=Keenetic User
PKG_LICENSE:=GPL-2.0

define Package/openvpn-sni-bypass
	SECTION:=net
	CATEGORY:=Keenetic
	SUBMENU:=Network
	TITLE:=OpenVPN with SNI Bypass and TLS 1.3 support
	DEPENDS:=+openvpn-openssl +stunnel
	MAINTAINER:=Keenetic User
endef

define Package/openvpn-sni-bypass/description
	OpenVPN with SNI Bypass and TLS 1.3 support.
	Automatically configures OpenVPN to bypass DPI using SNI obfuscation.
	SNI Host: play.googleapis.com
	TLS Support: 1.0, 1.1, 1.2, 1.3
	Modern cipher suites for maximum compatibility.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/openvpn-sni-bypass/install
	$(INSTALL_DIR) $(1)/opt/bin
	$(INSTALL_BIN) ./files/opt/bin/openvpn-sni-wrapper $(1)/opt/bin/
	$(INSTALL_DIR) $(1)/opt/etc/init.d
	$(INSTALL_BIN) ./files/opt/etc/init.d/S25openvpn-sni $(1)/opt/etc/init.d/
	$(INSTALL_DIR) $(1)/opt/etc/ndm/netfilter.d
	$(INSTALL_BIN) ./files/opt/etc/ndm/netfilter.d/010-openvpn-sni.sh $(1)/opt/etc/ndm/netfilter.d/
	$(INSTALL_DIR) $(1)/opt/etc/openvpn
	$(INSTALL_BIN) ./files/opt/etc/openvpn/config-processor.sh $(1)/opt/etc/openvpn/
	$(INSTALL_DATA) ./files/opt/etc/openvpn/README $(1)/opt/etc/openvpn/
	$(INSTALL_DIR) $(1)/opt/etc/stunnel
endef

define Package/openvpn-sni-bypass/postinst
#!/bin/sh
#
# Copyright (C) 2023 Keenetic User
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

echo "Installing OpenVPN SNI Bypass v1.1..."

# Make scripts executable
chmod +x /opt/bin/openvpn-sni-wrapper
chmod +x /opt/etc/init.d/S25openvpn-sni
chmod +x /opt/etc/openvpn/config-processor.sh

# Backup original OpenVPN binary and link wrapper
if [ -f /opt/sbin/openvpn ] && [ ! -L /opt/sbin/openvpn ]; then
	mv /opt/sbin/openvpn /opt/sbin/openvpn.original
fi
ln -sf /opt/bin/openvpn-sni-wrapper /opt/sbin/openvpn

# Create log directory
mkdir -p /var/log

# Start service
/opt/etc/init.d/S25openvpn-sni start

echo ""
echo "============================================"
echo "OpenVPN SNI Bypass installed successfully!"
echo "============================================"
echo "SNI Host: play.googleapis.com"
echo "TLS Support: 1.0, 1.1, 1.2, 1.3"
echo "SSH Port: 222"
echo ""
echo "Usage:"
echo "  Configure OpenVPN from Keenetic Web UI"
echo "  SNI bypass will be applied automatically"
echo ""
echo "Management:"
echo "  ssh -p 222 admin@192.168.1.1"
echo "  /opt/etc/init.d/S25openvpn-sni status"
echo "============================================"

exit 0
endef

define Package/openvpn-sni-bypass/prerm
#!/bin/sh
#
# Copyright (C) 2023 Keenetic User
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

echo "Removing OpenVPN SNI Bypass..."

# Stop service
/opt/etc/init.d/S25openvpn-sni stop

# Restore original OpenVPN binary
if [ -f /opt/sbin/openvpn.original ]; then
	rm -f /opt/sbin/openvpn
	mv /opt/sbin/openvpn.original /opt/sbin/openvpn
fi

# Kill stunnel just in case
killall stunnel 2>/dev/null || true

exit 0
endef

$(eval $(call BuildPackage,openvpn-sni-bypass))