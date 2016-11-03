##      ffwsn-site.mk
GLUON_SITE_PACKAGES := \
        gluon-mesh-batman-adv-15 \
        gluon-authorized-keys \
        ffpb-ebtables-net-rules \
        gluon-alfred \
        gluon-respondd\
        gluon-autoupdater \
        gluon-config-mode-autoupdater \
        gluon-config-mode-contact-info \
        gluon-config-mode-core \
        gluon-config-mode-geo-location \
        gluon-config-mode-hostname \
        gluon-config-mode-tunneldigger \
        gluon-ebtables-filter-multicast \
        gluon-ebtables-filter-ra-dhcp \
        gluon-luci-admin \
        gluon-luci-autoupdater \
        gluon-luci-portconfig \
        gluon-luci-private-wifi \
        gluon-luci-wifi-config \
        gluon-mesh-vpn-tunneldigger \
        gluon-next-node \
        gluon-radvd \
        gluon-setup-mode \
        gluon-status-page \
        haveged \
        iptables \
        gluon-tunneldigger-watchdog \
        gluon-migrate-vpn \
        ffsw-reboot \
        ffsw-chkgw \
        ffsw-keyupl \
        iwinfo

# add offline ssid only if the target has wifi device
ifeq ($(GLUON_TARGET),ar71xx-generic)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer
endif

ifeq ($(GLUON_TARGET),ar71xx-mikrotik)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer
endif

ifeq ($(GLUON_TARGET),ar71xx-nand)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer
endif

ifeq ($(GLUON_TARGET),mpc85xx-generic)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer
endif

ifeq ($(GLUON_TARGET),ramips-rt305x)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer
endif
# support the USB stack
USB_PACKAGES_BASIC := \
        kmod-usb-core \
        kmod-usb2

# FAT32 Support for USB
USB_PACKAGES_STORAGE := \
        block-mount \
        kmod-fs-ext4 \
        kmod-fs-vfat \
        kmod-usb-storage  \
        kmod-usb-storage-extras  \
        blkid  \
        swap-utils  \
        kmod-nls-cp1250  \
        kmod-nls-cp1251  \
        kmod-nls-cp437  \
        kmod-nls-cp775  \
        kmod-nls-cp850  \
        kmod-nls-cp852  \
        kmod-nls-cp866  \
        kmod-nls-iso8859-1  \
        kmod-nls-iso8859-13  \
        kmod-nls-iso8859-15  \
        kmod-nls-iso8859-2  \
        kmod-nls-koi8r  \
        kmod-nls-utf8

USB_PACKAGES_NET := \
        kmod-ath9k-htc \
        kmod-usb-net \
        kmod-usb-net-asix \
        kmod-usb-net-asix-ax88179 \
        kmod-usb-net-cdc-eem \
        kmod-usb-net-cdc-ether \
        kmod-usb-net-cdc-mbim \
        kmod-usb-net-cdc-ncm \
        kmod-usb-net-cdc-subset \
        kmod-usb-net-dm9601-ether \
        kmod-usb-net-hso \
        kmod-usb-net-huawei-cdc-ncm \
        kmod-usb-net-ipheth \
        kmod-usb-net-kalmia \
        kmod-usb-net-kaweth \
        kmod-usb-net-mcs7830 \
        kmod-usb-net-pegasus \
        kmod-usb-net-qmi-wwan \
        kmod-usb-net-rndis \
        kmod-usb-net-rtl8150 \
        kmod-usb-net-rtl8152 \
        kmod-usb-net-sierrawireless \
        kmod-usb-net-smsc95xx \
        kmod-mii \
        kmod-nls-base

TOOLS_PACKAGES := \
        usbutils


ifeq ($(GLUON_TARGET),x86-generic)
# support the usb stack on x86 devices
# and add a few common USB NICs
GLUON_SITE_PACKAGES += \
        kmod-usb-hid \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

ifeq ($(GLUON_TARGET),x86-64)
# support the usb stack on x86 devices
# and add a few common USB NICs
GLUON_SITE_PACKAGES += \
        kmod-usb-hid \
        $(USB_PACKAGES_BASIC) \
        $(USB_PACKAGES_STORAGE) \
        $(USB_PACKAGES_NET) \
        $(TOOLS_PACKAGES)
endif

##      DEFAULT_GLUON_RELEASE
#               version string to use for images
#               gluon relies on
#                       opkg compare-versions "$1" '>>' "$2"
#               to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := ffwsn-v017

#       GLUON_RELEASE
#               call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#               e.g.:
#                       $ make images GLUON_RELEASE=23.42+5
#               would generate images named like this:
#                       gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= en de

