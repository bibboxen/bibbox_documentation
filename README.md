# Documentation
Please see the installation guide for information about the, well installation.

# Notes

## Printers
The default printer used in this project was [TM-m30](https://github.com/bibboxen/bibbox_documentation/blob/master/install/install.sh#L218),
but that printer is not longer available for purchase an have be replaced bu TM-m30II-NT which gives the printer another device address
that can be found with (look for `direct usb`):

```
lpinfo -v
```

Then using this command you can update device path for the printer named `bon`:

```
lpadmin -p bon -E -v usb://EPSON/TM-m30II-NT -P /usr/share/ppd/Epson/tm-ba-thermal-rastertotmt.ppd
```

__Links__

* http://www.epson-pos.com/modules/pos/index.php?page=single_soft&cid=6918&scat=32&pcat=1
* https://download.epson-biz.com/modules/pos/index.php?page=soft&pcat=3&scat=32
* https://download.epson-biz.com/modules/pos/index.php?page=single_soft&cid=6918&scat=32&pcat=3