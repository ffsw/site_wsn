##		ffwss-site.mk

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-source-filter \
	mesh-batman-adv-15 \
	mesh-vpn-tunneldigger \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-wizard \

# radv-filterd\ erstmal weglassen - nicht sicher obs zusammen mit ebtables-filter-ra-dhcp funktioniert


##	GLUON_SITE_PACKAGES
#		Specify additional Gluon/LEDE packages to include here;
#		A minus sign may be prepended to remove a packages from the
#		selection that would be enabled by default or due to the
#		chosen feature flags
GLUON_SITE_PACKAGES :=	gluon-config-mode-geo-location-osm \
			gluon-authorized-keys \
			haveged ffsw-reboot \
			ffsw-chkgw ffsw-keyupl \
			iwinfo ffsw-banner \
			iperf3

#No Wifi Info 
NO_WIFI_INFO := \
	-ffffm-additional-wifi-json-info \

# add offline ssid only if the target has wifi device
ifeq ($(GLUON_TARGET),ar71xx-generic)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer \
	ffsw-wifi-quickfix \
	ffffm-button-bind    
	#ffffm-additional-wifi-json-info   --funzt in 2018 nicht	
endif

ifeq ($(GLUON_TARGET),ar71xx-tiny)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer \
	ffsw-wifi-quickfix \
	ffffm-button-bind
	#ffffm-additional-wifi-json-info   --funzt in 2018 nicht	
endif

ifeq ($(GLUON_TARGET),ar71xx-nand)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer \
	ffsw-wifi-quickfix \
	ffffm-button-bind
	#ffffm-additional-wifi-json-info   --funzt in 2018 nicht	
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer \
	ffsw-wifi-quickfix \
	ffffm-button-bind
	#ffffm-additional-wifi-json-info   --funzt in 2018 nicht	
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2709)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer \
	ffsw-wifi-quickfix \
	ffffm-button-bind
	#ffffm-additional-wifi-json-info   --funzt in 2018 nicht	
endif

ifeq ($(GLUON_TARGET),mpc85xx-generic)
GLUON_SITE_PACKAGES += \
	ffsw-ssid-changer \
	ffsw-wifi-quickfix \
	ffffm-button-bind
	#ffffm-additional-wifi-json-info   --funzt in 2018 nicht	
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

ifeq ($(GLUON_TARGET),x86-geode)
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

##wifi-button pacakge only on some ar71-models ############################
	GLUON_tp-link-tl-wr740n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v4_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr740n-nd-v5_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v4_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr741n-nd-v5_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v8_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v9_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v10_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v11_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr841n-nd-v12_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr842n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr842n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr842n-nd-v3_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v1_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v2_SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v3SITE_PACKAGES := ffffm-button-bind
	GLUON_tp-link-tl-wr1043n-nd-v4_SITE_PACKAGES := ffffm-button-bind
	#C25 zu Testzwecken mit aufgenommen
	#GLUON_tp-link-archer-c25-v1_SITE_PACKAGES := ffffm-button-bind	
	#Alle Archer ohne Wifi-Info
	GLUON_tp-link-archer-c25-v1_SITE_PACKAGES += $(NO_WIFI_INFO)
	GLUON_tp-link-archer-c7-v2_SITE_PACKAGES += $(NO_WIFI_INFO)
	GLUON_tp-link-archer-c7-v4_SITE_PACKAGES += $(NO_WIFI_INFO)
	GLUON_tp-link-archer-c5-v1_SITE_PACKAGES += $(NO_WIFI_INFO)
	
###########################################################################


##      DEFAULT_GLUON_RELEASE
#               version string to use for images
#               gluon relies on
#                       opkg compare-versions "$1" '>>' "$2"
#               to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := ffwsn-v037


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

GLUON_MULTIDOMAIN=0
