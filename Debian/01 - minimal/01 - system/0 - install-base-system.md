# INSTALL BASE SYSTEM

### INSTALL DEBOOTSTRAP
```bash
sudo apt install debootstrap -y
```
---

### DEFINE ENV VARIABLE
```bash
ROOT_DIR="base-system"
ARCH="amd64"
```
---

### MAKE ROOTFS MINIMAL 
```bash
sudo debootstrap --variant=minbase --arch $ARCH bookworm $ROOT_DIR http://deb.debian.org/debian
```
OR
```bash
sudo debootstrap --variant=minbase --arch $ARCH bookworm $ROOT_DIR http://ftp.us.debian.org/debian
```
### PACKAGE
- adduser
- apt
- base-files
- base-passwd
- bash
- bsdutils
- coreutils
- dash
- debconf
- debian-archive-keyring
- debianutils
- diffutils
- dpkg
- e2fsprogs
- findutils
- gcc-12-base
- gpgv
- grep
- gzip
- hostname
- init-system-helpers
- libacl1
- libapt-pkg6.0
- libattr1
- libaudit-common
- libaudit1
- libblkid1
- libbz2-1.0
- libc-bin
- libc6
- libcap-ng0
- libcap2
- libcom-err2
- libcrypt1
- libdb5.3
- libdebconfclient0
- libext2fs2
- libffi8
- libgcc-s1
- libgcrypt20
- libgmp10
- libgnutls30
- libgpg-error0
- libhogweed6
- libidn2-0
- liblz4-1
- liblzma5
- libmd0
- libmount1
- libnettle8
- libp11-kit0
- libpam-modules
- libpam-modules-bin
- libpam-runtime
- libpam0g
- libpcre2-8-0
- libseccomp2
- libselinux1
- libsemanage-common
- libsemanage2
- libsepol2
- libsmartcols1
- libss2
- libstdc++6
- libsystemd0
- libtasn1-6
- libtinfo6
- libudev1
- libunistring2
- libuuid1
- libxxhash0
- libzstd1
- login
- logsave
- mawk
- mount
- ncurses-base
- ncurses-bin
- passwd
- perl-base
- sed
- sysvinit-utils
- tar
- tzdata
- usr-is-merged
- util-linux
- util-linux-extra
- zlib1g
---

```bash
HOSTNAME="Lenovo-B490"
```

### UPDATE HOSTNAME
```bash
sudo editor $ROOT_DIR/etc/hostname
```
```bash
$HOSTNAME
```
---

### ADDED HOSTS
```bash
sudo editor $ROOT_DIR/etc/hosts
```
```
127.0.0.1       localhost
127.0.0.2       $HOSTNAME
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
```
---

### UPDATE RESOLV.CONF
```bash
sudo editor $ROOT_DIR/etc/resolv.conf
```
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```
---

### UPDATE SOURCE LIST
```bash
sudo editor $ROOT_DIR/etc/apt/sources.list
```
```bash
# REMOTE MAIN
#deb http://deb.debian.org/debian bookworm main
# REMOTE END

# REMOTE NON FREE FIRMWARE START
deb http://deb.debian.org/debian/ bookworm main non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
# REMOTE NON FREE FIRMWARE END
```

### ENABLE BASH-COMPLETION
```bash
sudo editor $ROOT_DIR/etc/bash.bashrc
```
```bash
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
```
---

### CLEAR DIRECTORY
```bash
sudo rm -rfv $ROOT_DIR/dev/*
sudo rm -rfv $ROOT_DIR/root/{.bashrc,.profile}
sudo rm -rfv $ROOT_DIR/run/*
sudo rm -rfv $ROOT_DIR/var/cache/*
sudo rm -rfv $ROOT_DIR/var/lib/apt/*
sudo rm -rfv $ROOT_DIR/var/log/*
```
---

### LINKED DIRECTORY /tmp TO /var/tmp
```bash
sudo rm -rf $ROOT_DIR/var/tmp
sudo ln -sf /tmp $ROOT_DIR/var/
```
```
drwxrwxrwt  2 root root  4096 Dec 10 04:08 tmp
```
---

### RUNNING SYSTEM WITH CHROOT
```bash
sudo mount --bind /dev $ROOT_DIR/dev
sudo mount --bind /dev/pts $ROOT_DIR/dev/pts
sudo mount --bind /proc $ROOT_DIR/proc
sudo mount -t tmpfs tmpfs $ROOT_DIR/root -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0700
sudo mount -t tmpfs tmpfs $ROOT_DIR/run -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0775
sudo mount --bind /sys $ROOT_DIR/sys
sudo mount -t tmpfs tmpfs $ROOT_DIR/tmp -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev
sudo mount -t tmpfs tmpfs $ROOT_DIR/var/backups -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo mount -t tmpfs tmpfs $ROOT_DIR/var/cache -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo mount -t tmpfs tmpfs $ROOT_DIR/var/lib/apt -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo mount -t tmpfs tmpfs $ROOT_DIR/var/log -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo chroot $ROOT_DIR
```
---

### SETUP TIMEZONE
```bash
dpkg-reconfigure tzdata
```
---

### UPDATE SOURCE LIST
```bash
apt update
```
---

### INSTALL WHIPTAIL
```bash
apt install --no-install-recommends --no-install-suggests whiptail
```
- libnewt0.52
- libpopt0
- libslang2
- whiptail
---

### INSTALL APT-UTILS FOR FIX (debconf: delaying package configuration, since apt-utils is not installed)
```bash
apt install --no-install-suggests --no-install-recommends apt-utils
```
- apt-utils
---

### SETUP LOCALES
#### SET LANG
```bash
echo "LANG=en_US.UTF-8" > $ROOT_DIR/etc/locale.conf
```
#### SET LC_ALL
```bash
echo "LC_ALL=en_US.UTF-8" >> $ROOT_DIR/etc/environment
```
```bash
apt install --no-install-suggests --no-install-recommends locales
```
- libc-l10n
- locales
#### CONFIGURE LOCALES
```bash
dpkg-reconfigure locales
```
---

### INSTALL BASH-COMPLETION
```bash
apt install --no-install-suggests --no-install-recommends bash-completion
```
- bash-completion
---

### REINSTALL ALL PACKAGE
```bash
package_name=$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')
apt install --no-install-suggests --no-install-recommends --reinstall $package_name
```
---

### EXIT CHROOT
```
exit
```
---

### UMOUNTS
```bash
sudo umount $ROOT_DIR/dev/pts
sudo umount $ROOT_DIR/dev
sudo umount $ROOT_DIR/proc
sudo umount $ROOT_DIR/root
sudo umount $ROOT_DIR/run
sudo umount $ROOT_DIR/sys
sudo umount $ROOT_DIR/tmp
sudo umount $ROOT_DIR/var/backups
sudo umount $ROOT_DIR/var/cache
sudo umount $ROOT_DIR/var/lib/apt
sudo umount $ROOT_DIR/var/log
```
---