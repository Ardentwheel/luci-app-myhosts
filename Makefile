# Copyright 2015 
# Matthew

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI for My Hosts
LUCI_PKGARCH:=all
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
