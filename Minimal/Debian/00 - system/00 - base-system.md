# MAKE ROOTFS BASE SYSTEM DEBIAN BOOKWORM
#
#
### SETUP DEBOOTSTRAP

- **Install Debootstrap**
	```bash
	sudo apt install --no-install-suggests --no-install-recommends debootstrap -y
	```

- **Make Rootfs Minbase**

	- **ENV**
		```bash
		ROOT_DIR="base-system"
		ARCH="amd64"
		CODENAME="bookworm"
		```

	- **Include**
		```bash
		INCLUDE="apt-utils,bash-completion,locales,whiptail"
		```

		- **apt-utils (For Fix debconf: delaying package configuration, since apt-utils is not installed)**

		- **bash-completion**

		- **locales (LANG)**
			- **dependencies**
				1. libc-l10n
				1. locales

		- **whiptail (For GUI Terminal)**
			- **dependencies**
				1. libnewt0.52
				1. libpopt0
				1. libslang2
				1. whiptail

	- **Running debootstrap (Please just choose one)**

		- **HTTP**
			```bash
			sudo debootstrap --variant=minbase --arch $ARCH --include=$INCLUDE $CODENAME $ROOT_DIR http://deb.debian.org/debian
			```

		- **FTP**
			```bash
			sudo debootstrap --variant=minbase --arch $ARCH --include=$INCLUDE $CODENAME $ROOT_DIR http://ftp.us.debian.org/debian
			```

	- **Instaled Packages From Debootstrap**
		1. adduser 3.134
		1. apt 2.6.1
		1. apt-utils 2.6.1
		1. base-files 12.4+deb12u6
		1. base-passwd 3.6.1
		1. bash 5.2.15-2+b7
		1. bash-completion 1:2.11-6
		1. bsdutils 1:2.38.1-5+deb12u1
		1. coreutils 9.1-1
		1. dash 0.5.12-2
		1. debconf 1.5.82
		1. debian-archive-keyring 2023.3+deb12u1
		1. debianutils 5.7-0.5~deb12u1
		1. diffutils 1:3.8-4
		1. dpkg 1.21.22
		1. e2fsprogs 1.47.0-2
		1. findutils 4.9.0-4
		1. gcc-12-base 12.2.0-14
		1. gpgv 2.2.40-1.1
		1. grep 3.8-5
		1. gzip 1.12-1
		1. hostname 3.23+nmu1
		1. init-system-helpers 1.65.2
		1. libacl1 2.3.1-3
		1. libapt-pkg6.0 2.6.1
		1. libattr1 1:2.5.1-4
		1. libaudit-common 1:3.0.9-1
		1. libaudit1 1:3.0.9-1
		1. libblkid1 2.38.1-5+deb12u1
		1. libbz2-1.0 1.0.8-5+b1
		1. libc-bin 2.36-9+deb12u7
		1. libc-l10n 2.36-9+deb12u7
		1. libc6 2.36-9+deb12u7
		1. libcap-ng0 0.8.3-1+b3
		1. libcap2 1:2.66-4
		1. libcom-err2 1.47.0-2
		1. libcrypt1 1:4.4.33-2
		1. libdb5.3 5.3.28+dfsg2-1
		1. libdebconfclient0 0.270
		1. libext2fs2 1.47.0-2
		1. libffi8 3.4.4-1
		1. libgcc-s1 12.2.0-14
		1. libgcrypt20 1.10.1-3
		1. libgmp10 2:6.2.1+dfsg1-1.1
		1. libgnutls30 3.7.9-2+deb12u3
		1. libgpg-error0 1.46-1
		1. libhogweed6 3.8.1-2
		1. libidn2-0 2.3.3-1+b1
		1. liblz4-1 1.9.4-1
		1. liblzma5 5.4.1-0.2
		1. libmd0 1.0.4-2
		1. libmount1 2.38.1-5+deb12u1
		1. libnettle8 3.8.1-2
		1. libnewt0.52 0.52.23-1+b1
		1. libp11-kit0 0.24.1-2
		1. libpam-modules 1.5.2-6+deb12u1
		1. libpam-modules-bin 1.5.2-6+deb12u1
		1. libpam-runtime 1.5.2-6+deb12u1
		1. libpam0g 1.5.2-6+deb12u1
		1. libpcre2-8-0 10.42-1
		1. libpopt0 1.19+dfsg-1
		1. libseccomp2 2.5.4-1+deb12u1
		1. libselinux1 3.4-1+b6
		1. libsemanage-common 3.4-1
		1. libsemanage2 3.4-1+b5
		1. libsepol2 3.4-2.1
		1. libslang2 2.3.3-3
		1. libsmartcols1 2.38.1-5+deb12u1
		1. libss2 1.47.0-2
		1. libstdc++6 12.2.0-14
		1. libsystemd0 252.26-1~deb12u2
		1. libtasn1-6 4.19.0-2
		1. libtinfo6 6.4-4
		1. libudev1 252.26-1~deb12u2
		1. libunistring2 1.0-2
		1. libuuid1 2.38.1-5+deb12u1
		1. libxxhash0 0.8.1-1
		1. libzstd1 1.5.4+dfsg2-5
		1. locales 2.36-9+deb12u7
		1. login 1:4.13+dfsg1-1+b1
		1. logsave 1.47.0-2
		1. mawk 1.3.4.20200120-3.1
		1. mount 2.38.1-5+deb12u1
		1. ncurses-base 6.4-4
		1. ncurses-bin 6.4-4
		1. passwd 1:4.13+dfsg1-1+b1
		1. perl-base 5.36.0-7+deb12u1
		1. sed 4.9-1
		1. sysvinit-utils 3.06-4
		1. tar 1.34+dfsg-1.2+deb12u1
		1. tzdata 2024a-0+deb12u1
		1. usr-is-merged 37~deb12u1
		1. util-linux 2.38.1-5+deb12u1
		1. util-linux-extra 2.38.1-5+deb12u1
		1. whiptail 0.52.23-1+b1
		1. zlib1g 1:1.2.13.dfsg-1

### CLEAN UP USELESS FOLDERS
```bash
PATH_DEV=$ROOT_DIR/dev
sudo rm -fr $PATH_DEV/*
[ "$(sudo ls -A $PATH_DEV)" ] && echo " notEmpty $PATH_DEV" || echo "isEmpty $PATH_DEV"
PATH_ROOT=$ROOT_DIR/root
sudo rm -fr $PATH_ROOT/{.bashrc,.profile}
[ "$(sudo ls -A $PATH_ROOT)" ] && echo " notEmpty $PATH_ROOT" || echo "isEmpty $PATH_ROOT"
PATH_RUN=$ROOT_DIR/run
sudo rm -fr $PATH_RUN/*
[ "$(sudo ls -A $PATH_RUN)" ] && echo " notEmpty $PATH_RUN" || echo "isEmpty $PATH_RUN"
PATH_CACHE=$ROOT_DIR/var/cache
sudo rm -fr $PATH_CACHE/*
[ "$(sudo ls -A $PATH_CACHE)" ] && echo " notEmpty $PATH_CACHE" || echo "isEmpty $PATH_CACHE"
PATH_APT=$ROOT_DIR/var/lib/apt
sudo rm -fr $PATH_APT/*
[ "$(sudo ls -A $PATH_APT)" ] && echo " notEmpty $PATH_APT" || echo "isEmpty $PATH_APT"
PATH_LOG=$ROOT_DIR/var/log
sudo rm -fr $PATH_LOG/*
[ "$(sudo ls -A $PATH_LOG)" ] && echo " notEmpty $PATH_LOG" || echo "isEmpty $PATH_LOG"
```

### SETUP LINKED DIRECTORY

- **Linked /tmp to /var/tmp**
	```bash
	sudo rm -rf $ROOT_DIR/var/tmp
	sudo ln -sf /tmp $ROOT_DIR/var/
	[ "$(sudo ls -la $ROOT_DIR/var | grep /tmp)" ] && echo "Linked directory /var/tmp to /tmp is correct" || echo "Linked directory /var/tmp to /tmp is incorrect"
	```

	**Default permission /var/tmp**
	```bash
	drwxrwxrwt  2 root root  4096 Mar 30 00:20 tmp
	```

### UPDATE HOSTNAME
```bash
cat << EOF | sudo tee $ROOT_DIR/etc/hostname &>/dev/null
x-host
EOF
```

### UPDATE HOSTS
```bash
cat << EOF | sudo tee $ROOT_DIR/etc/hosts &>/dev/null
127.0.0.1       localhost $(cat /etc/hostname) $(cat /etc/hostname).co.id
::1             localhost $(cat /etc/hostname) $(cat /etc/hostname).co.id ip6-localhost ip6-loopback
fe00::0         ip6-localnet
ff00::0         ip6-mcastprefix
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
EOF
```

### UPDATE RESOLV CONF
```bash
cat << EOF | sudo tee $ROOT_DIR/etc/resolv.conf &>/dev/null
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF
```

### UPDATE SOURCE LIST
- **Default (MAIN)**
	```bash
	cat << "EOF" | sudo tee $ROOT_DIR/etc/apt/sources.list &>/dev/null
	deb http://deb.debian.org/debian bookworm main
	EOF
	```
- **Non Free**
	```bash
	cat << EOF | sudo tee $ROOT_DIR/etc/apt/sources.list &>/dev/null
	# MAIN
	deb http://deb.debian.org/debian/ bookworm main non-free-firmware
	deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware

	# SECURITY
	deb http://security.debian.org/debian-security bookworm-security main non-free-firmware
	deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware

	# UPDATES
	deb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
	deb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware

	# BACKPORTS
	deb http://deb.debian.org/debian/ bookworm-backports main non-free-firmware
	deb-src http://deb.debian.org/debian/ bookworm-backports main non-free-firmware
	EOF
	```

### SETUP BASH COMPLETION
```bash
sudo sed -i -e 's/#if ! shopt -oq posix; then/if ! shopt -oq posix; then/' $ROOT_DIR/etc/bash.bashrc
sudo sed -i -e 's/#  if \[ -f \/usr\/share\/bash-completion\/bash_completion \]; then/  if \[ -f \/usr\/share\/bash-completion\/bash_completion \]; then/' $ROOT_DIR/etc/bash.bashrc
sudo sed -i -e 's/#    . \/usr\/share\/bash-completion\/bash_completion/    . \/usr\/share\/bash-completion\/bash_completion/' $ROOT_DIR/etc/bash.bashrc
sudo sed -i -e 's/#  elif \[ -f \/etc\/bash_completion \]; then/  elif \[ -f \/etc\/bash_completion \]; then/' $ROOT_DIR/etc/bash.bashrc
sudo sed -i -e 's/#    . \/etc\/bash_completion/    . \/etc\/bash_completion/' $ROOT_DIR/etc/bash.bashrc
sudo sed -i -e 's/#  fi/  fi/' $ROOT_DIR/etc/bash.bashrc
sudo sed -i -e 's/#fi/fi/' $ROOT_DIR/etc/bash.bashrc
```

### RUNNING SYSTEM WITH CHROOT
```bash
sudo mount --bind   /dev      $ROOT_DIR/dev
sudo mount --bind   /dev/pts  $ROOT_DIR/dev/pts
sudo mount -t tmpfs tmpfs     $ROOT_DIR/media         -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0775
sudo mount -t tmpfs tmpfs     $ROOT_DIR/mnt           -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0775
sudo mount --bind   /proc     $ROOT_DIR/proc
sudo mount -t tmpfs tmpfs     $ROOT_DIR/root          -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0700
sudo mount -t tmpfs tmpfs     $ROOT_DIR/run           -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0775
sudo mount --bind   /sys      $ROOT_DIR/sys
sudo mount -t tmpfs tmpfs     $ROOT_DIR/tmp           -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev
sudo mount -t tmpfs tmpfs     $ROOT_DIR/var/backups   -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo mount -t tmpfs tmpfs     $ROOT_DIR/var/cache     -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo mount -t tmpfs tmpfs     $ROOT_DIR/var/lib/apt   -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo mount -t tmpfs tmpfs     $ROOT_DIR/var/log       -o defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755
sudo chroot                   $ROOT_DIR
```

- **Configure Locales**
	```bash
	dpkg-reconfigure locales
	```

- **Setup Timezone**
	```bash
	dpkg-reconfigure tzdata
	```

- **Apt Update**
	```bash
	apt update
	```

- **Reinstall All Packages**
	```bash
	package_name=$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')
	apt install --no-install-recommends --no-install-suggests --reinstall $package_name
	```

- **Setup Banner TTY**

    - **Banner Default**
        ```bash
        Debian GNU/Linux 12 \n \l

        ```

    - **Banner Local**
        ```bash
        cat << EOF > /etc/issue
		\d \t on \l

		Name    : \n
		Os      : \s \m
		Kernel  : \r
		Version : \v

        EOF
        ```

    - **Banner Remote**
        ```bash
        cat << EOF > /etc/issue.net
		\d \t on \l

		Name    : \n
		Os      : \s \m
		Kernel  : \r
		Version : \v

        EOF
        ```

- **Exit Chroot**
	```bash
	exit
	```

### UMOUNTS
```bash
sudo umount $ROOT_DIR --recursive
```