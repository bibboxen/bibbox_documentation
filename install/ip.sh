#!/usr/bin/env bash

BOLD=$(tput bold)
UNDERLINE=$(tput sgr 0 1)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

###
# Set the IP (if static).
###
function set_ip {
 read -p "Enter IP: " IP
 read -p "Subnet Mask (28): " SUBNET
 read -p "Gateway (172.16.55.1): " GATEWAY
 read -p "DNS 1 (10.150.4.201): " DNS1
 read -p "DNS 2 (10.150.4.202): " DNS2

 SUBNET=${SUBNET:-"28"}
 GATEWAY=${GATEWAY:-"172.16.55.1"}
 DNS1=${DNS1:-"10.150.4.201"}
 DNS2=${DNS2:-"10.150.4.202"}

 echo "network:
    ethernets:
        $1:
            dhcp4: false
            addresses: [${IP}/${SUBNET}]
            routes:
              - to: default
                via: ${GATEWAY}
            nameservers:
              addresses: [${DNS1},${DNS2}]
    version: 2" | sudo tee /etc/netplan/01-bibbox-network.yaml > /dev/null
}

###
# Reset network to use DHCP
###
function set_dhcp {
  echo "network:
  ethernets:
    $1:
      dhcp4: true
  version: 2" | sudo tee /etc/netplan/01-bibbox-network.yaml > /dev/null
}

###
# Set hostname
##
function set_hostmane {
	sudo hostnamectl set-hostname $1
}

###
# DHCP question.
###
read -p "Do you wish to set dynamic IP - DHCP (y/n)? " yn
case $yn in
  [Yy]* )
		echo "${UNDERLINE}${GREEN}Network configuration${RESET}"
		echo "Ethernet adapters normally starts with ${RED}enp${RESET} and wireless ${RED}wlp${RESET}."
		echo "Select the interface to configure:"
		INTERFACES=$(ip -o link show | awk -F': ' '{print $2}' | tail -n +2)
		INTERFACES+=' Exit'
		select INTERFACE in ${INTERFACES};
		do
			case ${INTERFACE} in
				'Exit')
					exit;
					;;
				*)
					set_dhcp ${INTERFACE}
					break;
					;;
			esac
		done
		;;
  [Nn]* )
		;;
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
		INTERFACES=$(ip -o link show | awk -F': ' '{print $2}' | tail -n +2)
		INTERFACES+=' Exit'
		select INTERFACE in ${INTERFACES};
		do
			case ${INTERFACE} in
				'Exit')
					exit;
					;;
				*)
					set_ip ${INTERFACE}
					break;
					;;
			esac
		done
		;;
  [Nn]* )
		;;
esac

###
# Hostname question.
###
read -p "Do you wish to change hostname (y/n)? " yn
case $yn in
  [Yy]* )
		echo "${UNDERLINE}${GREEN}Hostname configuration${RESET}"
		HOSTNAME=$(sudo hostnamectl status | grep 'Static hostname' | awk -F': ' '{print $2}')
		read -p "HOSTNAME (${HOSTNAME}): " HOSTNAME
		set_hostmane ${HOSTNAME}

		sudo sed -i".bak" "/127.0.1.1/d" /etc/hosts
		echo "127.0.1.1 ${HOSTNAME}" | sudo tee -a /etc/hosts > /dev/null

		echo "${GREEN}Hostname updated, logout and in again to see change...${RESET}"
		;;
  [Nn]* )
		;;
esac

## Restart network anwait for it to be stable.
echo "${GREEN}Resetting network connections...${RESET}"
sudo netplan apply
