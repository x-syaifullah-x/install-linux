# SETUP BOOTLOADER

### SETUP FSTAB

- **Replace UUID With The UUID That Will Be Used**

- **Example**
    - **EXT4**
        ```bash
        UUID=00000000-0000-0000-0000-000000000001	/   ext4    defaults,noatime,nodiratime,errors=remount-ro,commit=1800,barrier=0     0   0
        ```
    - **F2FS**
        ```bash
        UUID=00000000-0000-0000-0000-000000000001   /   f2fs    defaults,noatime,nodiratime,fastboot                                    0   0
        ```

### MOUNT, OVERLAY SYSTEM AND RUNNING AS CHROOT
```bash
OVERLAY_DIR="/mnt/rootfs/overlay" && sudo rm -rf $OVERLAY_DIR
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
sudo modprobe efivarfs && sudo mount -t efivarfs efivarfs $ROOT_DIR/sys/firmware/efi/efivars
sudo chroot $ROOT_DIR
```

### SETUP RAID
```bash
cat << EOF > /etc/mdadm/mdadm.conf
HOMEHOST <system>
MAILADDR root
$(sudo mdadm --detail --scan /dev/md0)
EOF
```

### SETUP INITRAMFS CONF
- **Update Config**
    ```bash
    cat << EOF > /etc/initramfs-tools/initramfs.conf
    MODULES=most
    BUSYBOX=n
    KEYMAP=n
    COMPRESS=lz4
    COMPRESSLEVEL=0
    DEVICE=
    NFSROOT=auto
    RUNSIZE=100%
    FSTYPE=auto
    EOF
    ```

#### SET SIZE DIRECTORY DEV
- **Default**
    ```bash
    mount -t devtmpfs -o nosuid,mode=0755 udev /dev
    ```
- **Replace**
    ```bash
    sed -i -e 's/mount -t devtmpfs -o nosuid,mode=0755/mount -t devtmpfs -o nosuid,mode=0755,size=0/' /usr/share/initramfs-tools/init
    ```

### ADDED IO-SCHEDULER.RULES
- **Create Rules**
    ```bash
    cat << EOF > /etc/udev/rules.d/io-scheduler.rules
    ACTION=="add|change", KERNEL=="sd[a-z]|nvme*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
    EOF
    ```
- **Check**
    ```bash
    # Check :
    #   cat /sys/block/sdX/queue/scheduler
    #   cat /sys/block/nvme*/queue/scheduler
    #
    # (/sys/block/sdX/queue/rotationall == 0) is SSD
    ```

### SETUP GRUB
- **Mount EFI Partitions**
    ```bash
    mount /dev/sdxX /boot/efi --mkdir
    ```
- **ENV Bootloader ID**
```bash
BOOTLOADER_ID=Debian
```

- **Remove Directory EFI**
    ```bash
    rm -rf "/boot/efi/EFI/$BOOTLOADER_ID"
    ```

- **Remove Directory GRUB**
    ```bash
    rm -rf /boot/grub/*
    ```

- **Install GRUB-EFI-AMD64**
    ```bash
    apt install grub-efi-amd64
    ```

- **Setup File /etc/default/grub**
    ```bash
    cat << EOF > /etc/default/grub
    GRUB_DEFAULT=0
    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR="Debian Boot Manager"
    GRUB_CMDLINE_LINUX_DEFAULT="quiet consoleblank=180 loglevel=0 net.ifnames=0 mitigations=off modprobe.blacklist=efivarfs,loop,raid1,raid456,raid10 reboot=pci fsck.mode=skip"
    GRUB_CMDLINE_LINUX=""
    GRUB_DISABLE_OS_PROBER=false
    GRUB_GFXMODE=$(cat /sys/class/drm/*/modes | head -1)
    GRUB_DISABLE_LINUX_UUID=true
    GRUB_DISABLE_RECOVERY="true"
    GRUB_DISABLE_SUBMENU=y
    GRUB_BACKGROUND=/boot/theme/background.png
    GRUB_THEME=/boot/theme/theme.txt
    EOF
    ```

    - **Setup Grub Theme**

        - **[Download Theme](https://github.com/x-syaifullah-x/install-linux/blob/master/Others/z-Files/boot/theme.tar.gz)**

        - **COPY DIRECTORY THEME TO BOOT**
            ```bash
            cp -rf theme /boot
            ```

        - **Config Theme**
            ```bash
            cat << EOF >> /etc/default/grub
            GRUB_BACKGROUND=/boot/theme/background.png
            GRUB_THEME=/boot/theme/theme.txt
            EOF
            ```

- **Fix MDADM Rm Not Found On Booting**
    ```bash
    cat << EOF > /usr/share/initramfs-tools/scripts/local-bottom/mdadm
    #! /bin/sh
    [ -f /run/count.mdadm.initrd ] && rm -f /run/count.mdadm.initrd
    exit 0
    EOF
    ```

- **Install Needed For Iinitrd**
    ```bash
    apt install amd64-microcode firmware-realtek intel-microcode lz4
    ```

- **Update Grub**
    ```bash
    update-grub
    ```

- **Update grub.cfg**
    - **Without Grub Menu**
        ```bash
        cat << EOF > /boot/grub/grub.cfg
        set default='0'
        set timeout=0
        set pager=1
        set gfxpayload=keep
        menuentry 'Debian 12.7' --class debian --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-6.10.11+bpo-amd64-advanced-00000000-0000-0000-0000-000000000001' {
          echo 'Please wait a moment ...'
          insmod lzopio
          linux /boot/vmlinuz-6.10.11+bpo-amd64 root=/dev/md0 ro quiet consoleblank=180 loglevel=0 net.ifnames=0 mitigations=off modprobe.blacklist=efivarfs,loop,raid1,raid456,raid10 reboot=pci fsck.mode=skip
          initrd /boot/initrd.img-6.10.11+bpo-amd64
        }
        EOF
        ```
        ```bash
        nano /boot/grub/grub.cfg
        ```

### EFI CONFIGURATION
- **Create EFI**
    ```bash
    grub-install --verbose --no-nvram --recheck --compress=no --bootloader-id "$BOOTLOADER_ID"
    ```

- **Change Config Grub EFI**
    ```bash
    cat << EOF > /boot/efi/EFI/$BOOTLOADER_ID/grub.cfg
    set root=(md/0)
    set prefix=(\$root)'/boot/grub'
    configfile \$prefix/grub.cfg
    EOF
    ```

- **Install Bootloader**
    ```bash
    efibootmgr --verbose --create --disk /dev/sda --part 4 --label "Debian Boot Manager" --loader "/EFI/$BOOTLOADER_ID/shimx64.efi"
    ```

- **Exit Chroot**
```bash
exit
```

### UMOUNT OVERLAY SYSTEM
```bash
sudo umount --recursive $ROOT_DIR
```
