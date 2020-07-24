# INSTALL KERNEL

### INSTALL LINUX IMAGE
```bash
apt install --no-install-recommends --no-install-suggests linux-image-6.10.6+bpo-amd64
```

- **Dependencies**
    - **Before Install mdadm**
        1. cpio
        1. initramfs-tools
        1. initramfs-tools-core
        1. klibc-utils
        1. kmod
        1. libklibc
        1. linux-base
        1. linux-image-6.10.6+bpo-amd64
        
    - **After Install mdadm**
        1. initramfs-tools
        1. initramfs-tools-core
        1. klibc-utils
        1. libklibc
        1. linux-base
        1. linux-image-6.10.6+bpo-amd64

### Remove Old Kernel
```bash
rm -rf /{initrd.img.old,vmlinuz.old}
```