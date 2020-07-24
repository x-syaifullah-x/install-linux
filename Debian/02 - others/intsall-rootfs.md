# INSTALL ROOFS

### ENV ROOT_DIR
```bash
ROOT_DIR="/mnt/rootfs"
```
---

### EXTARCT ROOTFS.tar.xz
```bash
sudo mkdir -p $ROOT_DIR && sudo tar xvf rootfs.tar.xz -C $ROOT_DIR
```
---

### UPDATE MOUNT POINT ROOT(/) IN FSTAB
```bash
sudo nano $ROOT_DIR/etc/fstab
```
---

### MOUNT AND OVERLAY
```bash
OVERLAY_DIR="/run/overlay"
sudo mount --bind /dev $ROOT_DIR/dev
sudo mount --bind /dev/pts $ROOT_DIR/dev/pts
sudo mkdir -p $OVERLAY_DIR/{upperdir/etc,workdir/etc}
sudo mount -t overlay -o lowerdir=$ROOT_DIR/etc,upperdir=$OVERLAY_DIR/upperdir/etc,workdir=$OVERLAY_DIR/workdir/etc none $ROOT_DIR/etc
sudo mkdir -p $OVERLAY_DIR/{upperdir/home,workdir/home}
sudo mount -t overlay -o lowerdir=$ROOT_DIR/home,upperdir=$OVERLAY_DIR/upperdir/home,workdir=$OVERLAY_DIR/workdir/home none $ROOT_DIR/home
sudo mount -t tmpfs tmpfs $ROOT_DIR/media
sudo mount -t tmpfs tmpfs $ROOT_DIR/mnt
sudo mkdir -p $OVERLAY_DIR/{upperdir/opt,workdir/opt}
sudo mount -t overlay -o lowerdir=$ROOT_DIR/opt,upperdir=$OVERLAY_DIR/upperdir/opt,workdir=$OVERLAY_DIR/workdir/opt none $ROOT_DIR/opt
sudo mount --bind /proc $ROOT_DIR/proc
sudo mount -t tmpfs tmpfs $ROOT_DIR/root
sudo mount -t tmpfs tmpfs $ROOT_DIR/run
sudo mkdir -p $OVERLAY_DIR/{upperdir/srv,workdir/srv}
sudo mount -t overlay -o lowerdir=$ROOT_DIR/srv,upperdir=$OVERLAY_DIR/upperdir/srv,workdir=$OVERLAY_DIR/workdir/srv none $ROOT_DIR/srv
sudo mount --bind /sys $ROOT_DIR/sys
sudo mount -t tmpfs tmpfs $ROOT_DIR/tmp
sudo mkdir -p $OVERLAY_DIR/{upperdir/usr,workdir/usr}
sudo mount -t overlay -o lowerdir=$ROOT_DIR/usr,upperdir=$OVERLAY_DIR/upperdir/usr,workdir=$OVERLAY_DIR/workdir/usr none $ROOT_DIR/usr
sudo mkdir -p $OVERLAY_DIR/{upperdir/var,workdir/var}
sudo mount -t overlay -o lowerdir=$ROOT_DIR/var,upperdir=$OVERLAY_DIR/upperdir/var,workdir=$OVERLAY_DIR/workdir/var none $ROOT_DIR/var
```

### CHROOT SYSTEM
```bash
sudo chroot $ROOT_DIR
```
---

### MOUNT EFIVARFS
```bash
mount -t efivarfs efivarfs /sys/firmware/efi/efivars
```
---

### MOUNT EFI PARTITION
```bash
mount /dev/sdaX /boot/efi --mkdir
```
---

### INSTALL GRUB-EFI-AMD64
```bash
apt install --no-install-suggests --no-install-recommends grub-efi-amd64
```
---

### CLEAN GRUB
```bash
sudo rm -rf /boot/grub
```
---

### CLEAR DIRECTORY BOOTLOADER
```bash
sudo rm -rf /boot/efi/EFI/${bootloader-id}
```
---

### INSTALL XZ-UTILS FOR COMPRESS
```bash
apt install xz-utils
```
---

### INSTALL BOOTLOADER
```bash
grub-install --bootloader-id 'Debian' --compress xz
```

### GRUB CONFIG
```bash
nano /etc/default/grub
```
```
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=3
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
# GRUB_CMDLINE_LINUX_DEFAULT="mce=off modprobe.blacklist=iTCO_wdt splash intel_pstate=disable nouveau.modeset=0"
GRUB_CMDLINE_LINUX_DEFAULT="quiet consoleblank=60 loglevel=0 net.ifnames=0 fsck.mode=skip"
GRUB_CMDLINE_LINUX=""

# If your computer has multiple operating systems installed, then you
# probably want to run os-prober. However, if your computer is a host
# for guest OSes installed via LVM or raw disk devices, running
# os-prober can cause damage to those guest OSes as it mounts
# filesystems to look for things.
GRUB_DISABLE_OS_PROBER=false

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=640x480

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"

# Theme Configuration
GRUB_BACKGROUND=/boot/theme/background.png
GRUB_THEME=/boot/theme/theme.txt

GRUB_GFXMODE=1280x1024
```
---

### UPDATE GRUB
```bash
update-grub
```
---