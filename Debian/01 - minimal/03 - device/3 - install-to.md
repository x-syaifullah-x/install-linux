# INSTALL TO DEVICE

### SETUP FSTAB
```bash
sudo editor $ROOT_DIR/etc/fstab
```
```sh
# <file system>                                 <mount point>       <type>          <options>                                                                                            <dump>  <pass>
# SYSTEM ROOT EXT4
#UUID=00000000-0000-0000-0000-000000000001      /                   ext4            defaults,noatime,nodiratime,errors=remount-ro,commit=1800,barrier=0                                      0       0

# SYSTEM ROOT F2FS
#UUID=00000000-0000-0000-0000-000000000001      /                   f2fs            defaults,noatime,nodiratime,fastboot                                                                     0       0

# RAMFS OR TMPFS
tmpfs                                          /dev/shm             tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev                                0       0
none                                           /media               tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                                             0       0
none                                           /mnt                 tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                                             0       0
none                                           /root                tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0700                                             0       0
tmpfs                                          /run/lock            tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev,noexec                         0       0
none                                           /tmp                 tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev                                0       0
none                                           /var/backups         tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                                             0       0
none                                           /var/cache           tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                                             0       0
none                                           /var/lib/apt         tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                                             0       0
none                                           /var/log             tmpfs           defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                                             0       0
```
---

### ADDED GRUB CONFIG
```bash
sudo editor nano $ROOT_DIR/etc/default/grub
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

### COPY DIRECTORY THEME TO BOOT
```bash
sudo cp -rf /boot/theme $ROOT_DIR/boot
```
---

### MOUNT OVERLAY SYSTEM
```bash
OVERLAY_DIR="/tmp/rootfs/overlay"

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
---

### RUNNING SYSTEM WITH CHROOT
```bash
sudo chroot $ROOT_DIR
```

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

### CLEAR DIRECTORY BOOTLOADER
```bash
sudo rm -rf /boot/efi/EFI/${bootloader-id}
```
---

### INSTALL GRUB-EFI-AMD64
```bash
sudo apt install grub-efi-amd64
```
---

### CLEAR DIRECTORY GRUB
```bash
rm -rf /boot/grub
```
---

### INSTALL XZ-UTILS
```bash
apt install xz-utils
```
---

### INSTALL BOOTLOADER
```bash
grub-install --bootloader-id 'Debian' --compress xz
```

### UPDATE GRUB
```bash
update-grub
```
---

### UMOUNT OVERLAY SYSTEM
```bash
OVERLAY_DIR="/tmp/rootfs/overlay"

sudo umount $ROOT_DIR/dev/pts
sudo umount $ROOT_DIR/dev
sudo umount $ROOT_DIR/etc
sudo umount $ROOT_DIR/home
sudo umount $ROOT_DIR/media
sudo umount $ROOT_DIR/mnt
sudo umount $ROOT_DIR/opt
sudo umount $ROOT_DIR/proc
sudo umount $ROOT_DIR/root
sudo umount $ROOT_DIR/run
sudo umount $ROOT_DIR/srv
sudo umount $ROOT_DIR/sys
sudo umount $ROOT_DIR/tmp
sudo umount $ROOT_DIR/usr
sudo umount $ROOT_DIR/var
sudo rm -rf $OVERLAY_DIR
```
---