# INSTALL TO DEVICE

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

### MOUNT AND RUNNING CHROOT
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
sudo chroot $ROOT_DIR
```
- **Install GRUB-EFI-AMD64**
    ```bash
    apt install grub-efi-amd64
    ```
- **Setup File /etc/default/grub**

    - **Change GRUB_TIMEOUT=3**
        ```bash
        sed -i -e 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=3/' /etc/default/grub
        ```
    - **Change GRUB_CMDLINE_LINUX_DEFAULT**
        ```bash
        sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet consoleblank=60 loglevel=0 net.ifnames=0 fsck.mode=skip"/' /etc/default/grub
        ```
    - **Change GRUB_DISABLE_OS_PROBER**
        ```bash
        sed -i -e 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
        ```
    - **Change GRUB_GFXMODE**
        ```bash
        sed -i -e 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1280x1024/' /etc/default/grub
        ```
    - **Change GRUB_DISABLE_RECOVERY**
        ```bash
        sed -i -e 's/#GRUB_DISABLE_RECOVERY="true"/GRUB_DISABLE_RECOVERY="true"/' /etc/default/grub
        ```
    - **Setup Grub Theme**

        - **[Download Theme](https://github.com/x-syaifullah-x/install-linux/blob/master/Z-Files/boot/theme.tar.xz)**

        - **COPY DIRECTORY THEME TO BOOT**
            ```bash
            cp -rf theme /boot
            ```

        - **Config Theme**
            ```bash
            cat << "EOF" >> /etc/default/grub

            # Theme Configuration
            GRUB_BACKGROUND=/boot/theme/background.png
            GRUB_THEME=/boot/theme/theme.txt
            EOF
            ```

    - **Install EFi**
        ```bash
        BOOTLOADER_ID=Debian
        ```
        - **Mount efivarfs**
            ```bash
            mount -t efivarfs efivarfs /sys/firmware/efi/efivars
            ```

        - **Mount EFI Partition**
            ```bash
            mount /dev/sdaX /boot/efi --mkdir
            ```

        - **Remove Directory Bootloader If Exist**
            ```bash
            rm -rf /boot/efi/EFI/${BOOTLOADER_ID}
            ```

        - **Remove Directory GRUB**
            ```bash
            rm -rf /boot/grub
            ```

        - **Install Bootloader**
            ```bash
            grub-install --bootloader-id $BOOTLOADER_ID
            ```

        - **Update Grub**
            ```bash
            update-grub
            ```
            
        - **Exit Chroot**
            ```bash
            exit
            ```

### UMOUNT OVERLAY SYSTEM
```bash
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
```