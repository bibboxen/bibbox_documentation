#!/usr/bin/env bash

## Disable term blank
setterm -blank 0

## Script dir
SELF=$(pwd)

## Current user
USER=$(whoami);

## Find the dir.
cd ~/
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

## Define the release file.
VERSION="v1.4.4"
URL="https://github.com/bibboxen/bibbox/releases/download/${VERSION}/"
FILE="${VERSION}.tar.gz"

## Define colors.
BOLD=$(tput bold)
UNDERLINE=$(tput sgr 0 1)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

## Check if install has been executed before.
if [ -e $DIR/${DIR}/${VERSION}/ ]
then
		echo "${BOLD}Directory ${UNDERLINE}${RED}${DIR}/${VERSION}${RESET}${BOLD} already exists. Please remove it before running this script${RESET}"
		echo
		echo "rm -fr ${DIR}/${VERSION}"
		echo "rm -rf ~/bibbox"
		echo
		exit
fi

## Set the IP (if static).
function set_ip {
 read -p "Enter IP: " IP
 read -p "Netmask (255.255.255.240): " NETMASK
 read -p "Gateway (172.16.55.1): " GATEWAY
 read -p "DNS 1 (10.150.4.201): " DNS1
 read -p "DNS 2 (10.150.4.202): " DNS2

 NETMASK=${NETMASK:-"255.255.255.240"}
 GATEWAY=${GATEWAY:-"172.16.55.1"}
 DNS1=${DNS1:-"10.150.4.201"}
 DNS2=${DNS2:-"10.150.4.202"}

  sudo cat << DELIM >> ${DIR}/interfaces
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto $1
iface $1 inet static
  address ${IP}
  netmask ${NETMASK}
  gateway ${GATEWAY}
  dns-nameservers ${DNS1} ${DNS2}
DELIM
  sudo mv interfaces /etc/network/interfaces

}

while true; do
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
								break 2
								;;
							*)
								set_ip ${INTERFACE}
								break 2
								;;
						esac
					done
					break
					;;
        [Nn]* )
					break
					;;
        * ) echo "Please answer yes or no.";;
    esac
done

## Disable wify
echo "${BOLD}${RED}Disable WIFI to ensure installation.${RESET}"
echo "Select WIFI interface to disable:"
INTERFACES=$(ifconfig -s -a | cut -f1 -d" " | tail -n +2)
INTERFACES+=' No-wifi'
select INTERFACE in ${INTERFACES};
do
	case ${INTERFACE} in
		'No-wifi')
			echo "${UNDERLINE}${RED}You known best!${RESET}"
			sleep 2s
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

## Ensure system is up-to-date.
sudo apt-get update || exit 1
sudo apt-get upgrade -y || exit 1

## Get NodeJS.
wget -q -O - https://deb.nodesource.com/setup_6.x | sudo bash
sudo apt-get install nodejs -y || exit 1

## Install tools.
sudo apt-get install build-essential libudev-dev openssh-server fail2ban openjdk-8-jdk -y || exit 1

## Install usefull packages.
sudo apt-get install git supervisor redis-server -y || exit 1

## Set udev rule for barcode.
sudo cat << DELIM >> ${DIR}/40-barcode.rules
# Rule for barcode

# 'libusb' device nodes
SUBSYSTEM=="usb", ATTR{idVendor}=="05f9", ATTR{idProduct}=="2206", GROUP="plugdev"

DELIM
sudo mv ${DIR}/40-barcode.rules /etc/udev/rules.d/40-barcode.rules

## Set udev rule for RFID.
sudo cat << DELIM >> ${DIR}/41-rfid.rules
# Rule for Feig Leser
# USB Leser

ACTION!="add", GOTO="feig_rules_end"
SUBSYSTEM!="usb", GOTO="feig_rules_end"

ATTR{product}=="OBID RFID-Reader", ATTR{manufacturer}=="FEIG ELECTRONIC GmbH", MODE:="666", GROUP="users", SYMLINK+="feig_\$ATTR{serial}"
LABEL="feig_rules_end"

DELIM
sudo mv ${DIR}/41-rfid.rules /etc/udev/rules.d/41-rfid.rules

if [ -d "${SELF}/feig" ]; then
	FEIG_DEST="/opt/feig"
	sudo mkdir -p ${FEIG_DEST}
	for file in ${SELF}/feig/lib*.so*
	do
	    sudo cp $file ${FEIG_DEST}
	done

	for file in ${FEIG_DEST}/*
	do
	    libminor=${file%.[0-9]*}
	    libmajor=${libminor%.[0-9]*}
	    libname=${libmajor%.[0-9]*}
	    sudo ln -sf $file $libmajor
	    sudo ln -sf $libmajor $libname
	done
	sudo ldconfig ${FEIG_DEST}
fi

## Add bibbox packages (use symlink to match later update process).
mkdir ${DIR}/${VERSION}/ || exit 1
wget -q ${URL}${FILE} || exit 1
tar -zxf ${FILE} -C ${DIR}/${VERSION}/ || exit 1
rm -rf ${URL}${FILE}
ln -s ${DIR}/${VERSION}/ bibbox

cp ${SELF}/server.key ${DIR}/bibbox/
cp ${SELF}/server.crt ${DIR}/bibbox/

## Supervisor config
sudo cat << DELIM >> ${DIR}/bibbox.conf
[program:bibbox]
command=/usr/bin/node /home/${USER}/bibbox/bootstrap.js
autostart=true
autorestart=true
environment=NODE_ENV=production
stderr_logfile=/var/log/supervisor/bibbox.err.log
stdout_logfile=/var/log/supervisor/bibbox.out.log
user=root
DELIM

sudo mv ${DIR}/bibbox.conf /etc/supervisor/conf.d/bibbox.conf

# Fix supervisor install bug and ensure that it starts.
sudo systemctl enable supervisor
sudo systemctl start supervisor

## Add printer
sudo apt-get install cups libcups2 -y || exit 1
sudo dpkg -i ${SELF}/epson/*.deb || exit 1

tgtDir="/usr/share/ppd"
sudo mkdir -p "${tgtDir}/Epson"
sudo cp -p ${SELF}/epson/ppd/tm-* ${tgtDir}/Epson/
sudo chmod -f 644 ${tgtDir}/Epson/*

sudo lpadmin -p bon -E -v usb://EPSON/TM-m30 -P /usr/share/ppd/Epson/tm-ba-thermal-rastertotmt.ppd
sudo lpadmin -d bon

# Lock down queue to max one job.
sudo sh -c "echo 'MaxJobTime 30' >> /etc/cups/cupsd.conf"
sudo sh -c "echo 'MaxJobs 1' >> /etc/cups/cupsd.conf"

# Restart cups
sudo service cups restart

## Install x-server and openbox.
sudo apt-get install openbox xinit xterm -y || exit 1
sudo apt-get install lxdm xserver-xorg -y || exit 1

# Auto login.
sudo sh -c "sed -i '/# autologin=dgod/c autologin=${USER}' /etc/lxdm/lxdm.conf"
sudo sh -c "sed -i '/# session=\/usr\/bin\/startlxde/c session=\/usr\/bin\/openbox-session' /etc/lxdm/lxdm.conf"

# Ensure chrome is started with openbox.
mkdir -p ${DIR}/.config/openbox
cat << DELIM >> ${DIR}/.config/openbox/autostart
# Disalbe screensaver and monitor power managener.
xset s off
xset s noblank
xset -dpms

# Clear caches and other chrome stuff.
find ~/ -name *chrome* -exec rm -rf {} \;

# Make chrome default and start sub-shell to restart chrome if closed.
/usr/bin/google-chrome --make-default-browser
(RUN_CHROME=true;
while \${RUN_CHROME}; do
        GCH=\$(pgrep chrome -c);
        if [ -z \$DISPLAY ]; then
          RUN_CHROME=false;
          exit;
        fi
        if [ \$GCH != 0 ]; then
          RUN_CHROME=false;
          exit;
        fi
        /usr/bin/google-chrome --kiosk --no-first-run --disable-translate --enable-offline-auto-reload 'http://localhost:3010'
done) &
DELIM

# Set default config for openbox.
cp ${SELF}/rc.xml ${DIR}/.config/openbox

## Add chrome to the box.
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c "echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list"
sudo apt-get update || exit 1
sudo apt-get install google-chrome-stable -y || exit 1

## Fix time synce (aarhus)
sudo apt-get install ntp ntpstat -y || exit 1
sudo sh -c "echo 'pool ntp.aarhuskommune.local iburst' >> /etc/ntp.conf"

## Install wkhtmltopdf
sudo apt-get install xfonts-75dpi -y || exit 1
sudo dpkg -i ${SELF}/packages/wkhtmltox_0.14-bibbox.deb || exit 1

## Clean up
rm -rf ${DIR}/{Desktop,Downloads,Documents,Music,Pictures,Public,Templates,Videos,examples.desktop}
sudo apt-get --purge remove avahi-daemon -y || exit 1
sudo apt-get autoremove -y || exit 1

## Restart the show
reboot
