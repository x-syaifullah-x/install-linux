# MAKE BASE SYSTEM
#
#
### SETUP DEBOOTSTRAP
- **Install Debootstrap**
	```bash
	sudo apt install --no-install-suggests --no-install-recommends debootstrap -y
	```
- **Make Rootfs Minbase**
	- **ENV**
		```sh
		ROOTFS_DIR="/tmp/rootfs"
		ARCH="amd64"
		CODENAME="bookworm"
		```
	- **Include**
		```sh
		INCLUDE_PACKAGE="apt-utils,bash-completion,whiptail"
		```
		- **apt-utils (For Fix debconf: delaying package configuration, since apt-utils is not installed)**
		- **bash-completion**
		- **whiptail (For GUI Terminal)**
	- **Exclude**
		```sh
		EXCLUDE_PACKAGE="e2fsprogs,sysvinit-utils"
		```
	- **Running debootstrap**
		- **HTTP**
			```sh
			sudo debootstrap --variant=minbase --arch $ARCH --exclude=$EXCLUDE_PACKAGE --include=$INCLUDE_PACKAGE $CODENAME $ROOTFS_DIR http://deb.debian.org/debian
			```
		- **FTP**
			```sh
			sudo debootstrap --variant=minbase --arch $ARCH --exclude=$EXCLUDE_PACKAGE --include=$INCLUDE_PACKAGE $CODENAME $ROOTFS_DIR http://ftp.us.debian.org/debian
			```
### CLEAN UP USELESS FOLDERS
```sh
for dir in dev etc/.pwd.lock root run var/cache var/lib/apt var/lib/dpkg/diversions-old var/lib/dpkg/diversions-old var/lib/dpkg/status-old var/log; do
  if [ -f "$ROOTFS_DIR/$dir" ]; then
    sudo rm -rfv $ROOTFS_DIR/$dir
    continue
  fi
  for i in $(sudo ls -A $ROOTFS_DIR/$dir 2>/dev/null); do
    sudo rm -rfv $ROOTFS_DIR/$dir/$i
  done
done
```
### UPDATE SOURCE LIST
- **Default**
	```sh
	cat << "EOF" | sudo tee $ROOTFS_DIR/etc/apt/sources.list
	deb http://deb.debian.org/debian bookworm main
	EOF
	```
- **New**
	```sh
	cat << EOF | sudo tee $ROOTFS_DIR/etc/apt/sources.list
	deb http://deb.debian.org/debian               bookworm           main contrib non-free non-free-firmware
	deb http://security.debian.org/debian-security bookworm-security  main contrib non-free non-free-firmware
	deb http://deb.debian.org/debian               bookworm-updates   main contrib non-free non-free-firmware
	deb http://deb.debian.org/debian               bookworm-backports main contrib non-free non-free-firmware
	EOF
	```
### SETUP BASH BASHRC
```sh
cat << "EOF" | sudo tee $ROOTFS_DIR/etc/bash.bashrc
[ -z "$PS1" ] && return

shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

if ! shopt -oq posix; then
	. /usr/share/bash-completion/bash_completion
fi
EOF
```
### SETUP LOCALE
```sh
cat << EOF | sudo tee $ROOTFS_DIR/etc/default/locale
LANG=C.UTF-8
LANGUAGE=C.UTF-8
LC_ADDRESS=C.UTF-8
LC_ALL=C.UTF-8
LC_COLLATE=C.UTF-8
LC_CTYPE=C.UTF-8
LC_IDENTIFICATION=C.UTF-8
LC_MEASUREMENT=C.UTF-8
LC_MESSAGES=C.UTF-8
LC_MONETARY=C.UTF-8
LC_NAME=C.UTF-8
LC_NUMERIC=C.UTF-8
LC_PAPER=C.UTF-8
LC_TELEPHONE=C.UTF-8
LC_TIME=C.UTF-8
EOF
```
### SETUP KEYBOARD
```sh
cat << EOF | sudo tee $ROOTFS_DIR/etc/default/keyboard
XKBLAYOUT=us
EOF
```
### SETUP KEYMAP
```sh
cat << EOF | sudo tee $ROOTFS_DIR/etc/vconsole.conf
KEYMAP=us
EOF
```
### DPKG CONF
```bash
cat << EOF | sudo tee $ROOTFS_DIR/etc/dpkg/dpkg.cfg.d/x-dpkg
force-unsafe-io
path-exclude=/usr/share/doc/*
path-exclude=/usr/share/doc-base/*
path-exclude=/usr/share/man/*
path-exclude=/usr/share/info/*
path-exclude=/usr/share/lintian/*
path-exclude=/usr/share/locale/*
path-include=/usr/share/locale/en*
EOF
```
### DPKG Clear Path Exclude
```bash
for _paths in $(sed -n 's|path-[a-z]*=\(/[^/]*\(/[^/]*\)*\)/.*|\1|p' $ROOTFS_DIR/etc/dpkg/dpkg.cfg.d/x-dpkg | uniq); do
  for _path in $(ls -A "$ROOTFS_DIR$_paths"); do
    sudo rm -rfv "$ROOTFS_DIR$_paths/$_path"
  done
done
```
### RUNNING SYSTEM WITH CHROOT
```sh
sudo mount -v udev     -t devtmpfs $ROOTFS_DIR/dev         -o defaults,size=0
sudo mount -v devpts   -t devpts   $ROOTFS_DIR/dev/pts     -o defaults
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/media       -o defaults,size=100%,nr_inodes=0,mode=0775
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/mnt         -o defaults,size=100%,nr_inodes=0,mode=0775
sudo mount -v proc     -t proc     $ROOTFS_DIR/proc        -o defaults
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/root        -o defaults,size=100%,nr_inodes=0,mode=0700
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/run         -o defaults,size=100%,nr_inodes=0,mode=0775
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/run/lock    -o defaults,size=100%,nr_inodes=0,nosuid,nodev,noexec     --mkdir
sudo mount -v sysfs    -t sysfs    $ROOTFS_DIR/sys         -o defaults
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/tmp         -o defaults,size=100%,nr_inodes=0,mode=1777,nosuid,nodev
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/var/cache   -o defaults,size=100%,nr_inodes=0,mode=0755
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/var/lib/apt -o defaults,size=100%,nr_inodes=0,mode=0755
sudo mount -v tmpfs    -t tmpfs    $ROOTFS_DIR/var/log     -o defaults,size=100%,nr_inodes=0,mode=0755
sudo chroot                        $ROOTFS_DIR
```
- **Reinstall All Packages**
	```sh
	apt update
	packages=$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')
	<!-- 88 package -->
	apt install --no-install-recommends --no-install-suggests --reinstall $packages
	```
- **Exit Chroot**
	```sh
	exit
	```
### UMOUNTS
```sh
for dir in $(mount | grep "$ROOTFS_DIR/" | awk '{print $3}'); do
  mount | grep -q "on $dir type" && sudo umount -v --recursive $dir
done
```