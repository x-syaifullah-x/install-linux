# INSTALL KERNEL
#
#
### INSTALL LINUX IMAGE
```sh 
apt install --no-install-recommends --no-install-suggests linux-image-6.11.5+bpo-amd64
```
- **Dependencies Before Install DE**
    1. cpio
    1. initramfs-tools
    1. initramfs-tools-core
    1. klibc-utils
    1. kmod
    1. libklibc
    1. linux-base
    1. linux-image-6.11.5+bpo-amd64
    1. logsave
    1. udev
- **Dependencies**
    1. cpio
    1. initramfs-tools
    1. initramfs-tools-core
    1. klibc-utils
    1. kmod
    1. libklibc
    1. linux-base
    1. linux-image-6.11.5+bpo-amd64
    1. logsave
### REMOVE OLD KERNERL
```sh 
rm -rfv /initrd.img.old /vmlinuz.old
```
### DISABLE UPDATE_INITRAMFS
```sh 
sed -i -e 's/update_initramfs=yes/update_initramfs=no/' /etc/initramfs-tools/update-initramfs.conf
```