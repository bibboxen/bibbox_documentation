# Clone setup

When needing to install many new boxes one can make a main disk with IP configuration set to dynamic and neutral host
name. This disk can then be used to clone to new disks and inserted into boxes. 

This mini guide explains the steps needed to clone a disk using the "goobay" SATA III HDD, which can clone disks without 
the need of a computer. You can also skip step 1 and use any other clone tool or software.

All that is required is an Ubuntu 22.04 server with the bibbox software installed, which can set up using the 
installation guide located in this repository.

## Step 1 (clone disk)

Use the "goobay" to clone the disk by placing the main disk in slot A and the target in slot B. Turn on power and when 
the yellow light at A and B is turned on press the `clone` button and hold until `100%` light up, then release and 
press once more on the button. The disk clone starts (take a cup of coffee).

When `100%` lights up continually the process is completed, turn power off.

## Step 2 (Switch disks)

Insert the new disk into the `nuk` or any other client you are using and let it boot up. It may take some time, if the 
device is not connected to the internet.

## Step 3 (Get a terminal)

When it is boot up (you will need a keyboard and mouse) press `ctrl+w` to close Chrome, and before Chrome restarts `left 
click` the screen with the mouse and click `Terminal emulator` to start a terminal, logged-in as `bibbox` user. If Chrome starts and 
covers the terminal, use `alt+tab` to switch between terminal and Chrome.

## Step 4 (Change ip and hostname)

In the terminal run `install/ip.sh` to start the helper script and follow the on-screen guide.

## Step 5 (Configuration)

When the box is online with the correct IP and hostname, push new translations and configuration from the administrative
user interface.

## Step 6 (Complete)

Reboot the box to ensure everything is working and that it boots up correctly.
