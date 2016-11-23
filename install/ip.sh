#!/usr/bin/env bash

## Set the IP (if static).
function set_ip {
 read -p "IP: " IP
 read -p "Netmask (255.255.255.240): " NETMASK
 read -p "Gateway (172.16.55.1): " GATEWAY
 read -p "Boardcase (172.16.55.255): " CAST
 read -p "DNS 1 (10.150.4.201): " DNS1
 read -p "DNS 2 (10.150.4.204): " DNS2

 NETMASK=${NETMASK:-"255.255.255.240"}
 GATEWAY=${GATEWAY:-"172.16.55.1"}
 CAST=${CAST:-"172.16.55.255"}
 DNS1=${DNS1:-"10.150.4.201"}
 DNS2=${DNS2:-"10.150.4.202"}

  sudo cat << DELIM >> interfaces.conf
auto lo
iface lo inet loopback
auto $1
iface $1 inet static
  address ${IP}
  netmask ${NETMASK}
  gateway ${GATEWAY}
  broadcast ${CAST}
  dns-nameservers ${DNS1} ${DNS2}
DELIM
  sudo mv interfaces.conf /etc/network/interfaces

  exit;
}

echo "Select the interface to configure:"
INTERFACES=$(nmcli -t --fields DEVICE dev)
INTERFACES+=' Exit'
select INTERFACE in ${INTERFACES};
do
	case ${INTERFACE} in
		'Exit')
			exit;
			break
			;;
		*)
			set_ip ${INTERFACE}
			;;
	esac
done
