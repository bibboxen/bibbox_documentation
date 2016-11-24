#!/usr/bin/env bash

## Set the IP (if static).
function set_ip {
 read -p "IP: " IP
 read -p "Netmask (255.255.255.240): " NETMASK
 read -p "Gateway (172.16.55.1): " GATEWAY
 read -p "DNS 1 (10.150.4.201): " DNS1
 read -p "DNS 2 (10.150.4.204): " DNS2

 NETMASK=${NETMASK:-"255.255.255.240"}
 GATEWAY=${GATEWAY:-"172.16.55.1"}
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
  dns-nameservers ${DNS1} ${DNS2}
DELIM
  sudo mv interfaces.conf /etc/network/interfaces
}

echo "Select the interface to configure:"
INTERFACES=$(ifconfig -s -a | cut -f1 -d" " | tail -n +2)
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
			break;
			;;
	esac
done

echo "${BOLD}${RED}Disable WIFI to lock down.${RESET}"
echo "Select WIFI interface to disable:"
INTERFACES=$(ifconfig -s -a | cut -f1 -d" " | tail -n +2)
INTERFACES+=' No-wifi'
select INTERFACE in ${INTERFACES};
do
	case ${INTERFACE} in
		'No-wifi')
			echo "${UNDERLINE}${RED}You known best!${RESET}"
			sleep 5s
			break
			;;
		*)
			sudo sh -c 'echo "iface ${INTERFACE} inet manual" >> /etc/network/interfaces'
			break
			;;
	esac
done
