# INSTALL KERNEL

### INSTALL KERNEL
```bash
apt install --no-install-suggests --no-install-recommends linux-image-6.1.0-17-amd64
```
- cpio
- initramfs-tools
- initramfs-tools-core
- klibc-utils
- kmod
- libklibc
- libkmod2
- libssl3
- linux-base
- linux-image-6.1.0-17-amd64
- udev
---

### SETUP /usr/share/initramfs-tools/init
```bash
sudo editor $ROOT_DIR/usr/share/initramfs-tools/init
```
```bash
mount -t devtmpfs -o nosuid,mode=0755,size=0 udev /dev
```
---

### SETUP INITRAMFS CONF
```bash
sudo editor $ROOT_DIR/etc/initramfs-tools/initramfs.conf
```
---

### INSTALL LZ4 FOR COMPRESS KERNEL
```bash
apt install --no-install-suggests --no-install-recommends lz4
```
- lz4
---

### INSTALL INIT
```bash
apt install --no-install-suggests --no-install-recommends init
```
- dmsetup
- init
- libapparmor1
- libargon2-1
- libcryptsetup12
- libdevmapper1.02.1
- libfdisk1
- libip4tc2
- libjson-c5
- libsystemd-shared
- systemd
- systemd-sysv
---

### SETUP LOGIND CONF
```bash
sudo editor $ROOT_DIR/etc/systemd/logind.conf
```
```
RuntimeDirectorySize=100%
```
---