packages {
    'iwinfo',
    'gluon-config-mode-geo-location-osm',
    'gluon-authorized-keys',        
    'gluon-web-private-wifi',
    'ffsw-reboot',
    'ffsw-chkgw',
    'ffsw-keyupl',
    'ffsw-banner',
    'iperf3',
}



features {
    'autoupdater',
    'ebtables-filter-multicast',
    'ebtables-filter-ra-dhcp',
    'ebtables-source-filter',
    'mesh-batman-adv-15',
    'mesh-vpn-tunneldigger',
    'respondd',
    'status-page',
    'web-advanced',
    'web-wizard',
}

if not device_class('tiny') then
    features {
        'wireless-encryption-wpa3',
    }
end

-- support the USB stack
USB_PACKAGES_BASIC = {
        'kmod-usb-core',
        'kmod-usb2',
        }

-- FAT32 Support for USB
USB_PACKAGES_STORAGE = {
        'block-mount',
        'kmod-fs-ext4',
        'kmod-fs-vfat',
        'kmod-usb-storage ',
        'kmod-usb-storage-extras ',
        'blkid ',
        'swap-utils ',
        'kmod-nls-cp1250',
        'kmod-nls-cp1251',
        'kmod-nls-cp437',
        'kmod-nls-cp775',
        'kmod-nls-cp850',
        'kmod-nls-cp852',
        'kmod-nls-cp866',
        'kmod-nls-iso8859-1',
        'kmod-nls-iso8859-13',
        'kmod-nls-iso8859-15',
        'kmod-nls-iso8859-2',
        'kmod-nls-koi8r',
        'kmod-nls-utf8',
        }

USB_PACKAGES_NET = {
        'kmod-ath9k-htc',
        'kmod-usb-net',
        'kmod-usb-net-asix',
        'kmod-usb-net-asix-ax88179',
        'kmod-usb-net-cdc-eem',
        'kmod-usb-net-cdc-ether',
        'kmod-usb-net-cdc-mbim',
        'kmod-usb-net-cdc-ncm',
        'kmod-usb-net-cdc-subset',
        'kmod-usb-net-dm9601-ether',
        'kmod-usb-net-hso',
        'kmod-usb-net-huawei-cdc-ncm',
        'kmod-usb-net-ipheth',
        'kmod-usb-net-kalmia',
        'kmod-usb-net-kaweth',
        'kmod-usb-net-mcs7830',
        'kmod-usb-net-pegasus',
        'kmod-usb-net-qmi-wwan',
        'kmod-usb-net-rndis',
        'kmod-usb-net-rtl8150',
        'kmod-usb-net-rtl8152',
        'kmod-usb-net-sierrawireless',
        'kmod-usb-net-smsc95xx',
        'kmod-mii',
        'kmod-nls-base',
        }

TOOLS_PACKAGES = {
        'usbutils'
        }

NO_WIFI = false

--no wifi in x86 targets
if target('x86-generic', 'x86-geode', 'x86-64')
 then
	NO_WIFI = true
 end

if not NO_WIFI then 
	packages { 'ffsw-ssid-changer','ffsw-wifi-quickfix' }
end	
 
-- support the usb stack on x86 and add a few common USB NICs
if target('x86-generic', 'x86-geode', 'x86-64')
then
    packages(USB_PACKAGES_BASIC)
    packages(USB_PACKAGES_STORAGE)
    packages(USB_PACKAGES_NET)
    packages(TOOLS_PACKAGES)
    packages {'kmod-usb-hid'}
end


--wifi-button pacakge only on some ar71-models 
if device({
        'tp-link-tl-wr842n-nd-v1',
		'tp-link-tl-wr842n-nd-v2',
		'tp-link-tl-wr842n-nd-v3',
        'tp-link-tl-wr1043n-nd-v1',
		'tp-link-tl-wr1043n-nd-v2',
		'tp-link-tl-wr1043n-nd-v3',
		'tp-link-tl-wr1043n-nd-v4',
		'tp-link-archer-c25-v1',
		'tp-link-archer-c7-v2',
		'tp-link-archer-c7-v4',
		'tp-link-archer-c7-v5',
		'tp-link-archer-c5-v1',		
    }) then
        packages {'ffffm-button-bind'}
end
			
