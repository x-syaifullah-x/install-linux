# INSTALL KERNEL

### INSTALL LINUX IMAGE
```bash
apt install --no-install-recommends --no-install-suggests linux-image-6.1.0-23-amd64
```

- **Dependencies**
    1. cpio
    1. initramfs-tools
    1. initramfs-tools-core
    1. klibc-utils
    1. kmod
    1. libklibc
    1. libkmod2
    1. libssl3
    1. linux-base
    1. linux-image-6.1.0-23-amd64
    1. udev

#### SET SIZE DIRECTORY /dev TO 0
- **Default**
    ```bash
    mount -t devtmpfs -o nosuid,mode=0755 udev /dev
    ```
- **Replace**
    ```bash
    sed -i -e 's/mount -t devtmpfs -o nosuid,mode=0755/mount -t devtmpfs -o nosuid,mode=0755,size=0/' /usr/share/initramfs-tools/init
    ```

### SETUP INITRAMFS CONF

- **Disable Busybox**
    ```bash
    sed -i -e 's/BUSYBOX=auto/BUSYBOX=n/' /etc/initramfs-tools/initramfs.conf
    ```

- **Use Compress LZ4**
    ```bash
    sed -i -e 's/COMPRESS=zstd/COMPRESS=lz4/' /etc/initramfs-tools/initramfs.conf
    ```
    - **Install lz4 for compress**
        ```bash
        apt install --no-install-recommends --no-install-suggests lz4
        ```
        - **Dependencies**
            1. lz4

- **Change Compress Level**
    ```bash
    sed -i -e 's/# COMPRESSLEVEL=3/\nCOMPRESSLEVEL=0/' /etc/initramfs-tools/initramfs.conf
    ```

- **Change Run Size**
    ```bash
    sed -i -e 's/RUNSIZE=10%/RUNSIZE=100%/' /etc/initramfs-tools/initramfs.conf
    ```

- **Update Initramfs**
    ```bash
    update-initramfs -d -c -k all
    ```

### Remove Old Kernel
```bash
rm -rf /{initrd.img.old,vmlinuz.old}
```