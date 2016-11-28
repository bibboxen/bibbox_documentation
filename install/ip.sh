#!/usr/bin/env bash

BOLD=$(tput bold)
UNDERLINE=$(tput sgr 0 1)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

## Set the IP (if static).
function set_ip {
 read -p "IP: " IP
 read -p "Netmask (255.255.255.240): " NETMASK
 read -p "Gateway (172.16.55.1): " GATEWAY
 read -p "DNS 1 (10.150.4.201): " DNS1
 read -p "DNS 2 (10.150.4.202): " DNS2

 NETMASK=${NETMASK:-"255.255.255.240"}
 GATEWAY=${GATEWAY:-"172.16.55.1"}
 DNS1=${DNS1:-"10.150.4.201"}
 DNS2=${DNS2:-"10.150.4.202"}

  sudo cat << DELIM >> interfaces.conf
#The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto $1
iface $1 inet static
  address ${IP}
  netmask ${NETMASK}
  gateway ${GATEWAY}
  dns-nameservers ${DNS1} ${DNS2}
DELIM
  sudo mv interfaces.conf /etc/network/interfaces
}

function set_dhcp {
  sudo cat << DELIM >> interfaces.conf
#The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto $1
iface $1 inet dhcp
DELIM

  sudo mv interfaces.conf /etc/network/interfaces
}

###
# DHCP question.
###
read -p "Do you wish to set dynamic IP (y/n)? " yn
case $yn in
    [Yy]* )
		echo "${UNDERLINE}${GREEN}Network configuration${RESET}"
		echo "Ethernet adapters normaly starts with ${RED}enp${RESET} and wireless ${RED}wlp${RESET}."
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
					set_dhcp ${INTERFACE}
					break;
					;;
			esac
		done
    [Nn]* )
			break
			;;
    * ) echo "Please answer yes or no.";;
esac

###
# Static IP question.
###
read -p "Do you wish to set static IP (y/n)? " yn
case $yn in
    [Yy]* )
		echo "${UNDERLINE}${GREEN}Network configuration${RESET}"
		echo "Ethernet adapters normaly starts with ${RED}enp${RESET} and wireless ${RED}wlp${RESET}."
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
    [Nn]* )
			break
			;;
    * ) echo "Please answer yes or no.";;
esac


###
# WIFY question.
###
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
			sudo sh -c "echo 'iface ${INTERFACE} inet manual' >> /etc/network/interfaces"
			break
			;;
	esac
done

## Restart network anwait for it to be stable.
echo "${GREEN}Resetting network connections...${RESET}"
sudo service networking restart
