# INSTALL PACKAGE EXTRA
#
#
### INSTALL INIT
```sh
apt install --no-install-recommends --no-install-suggests init
```
- **Dependencies After Install Kernel**
    1. dmsetup
    1. init
    1. libapparmor1
    1. libargon2-1
    1. libcryptsetup12 
    1. libdevmapper1.02.1 
    1. libfdisk1 
    1. libip4tc2 
    1. libjson-c5
    1. libkmod2
    1. libssl3 
    1. libsystemd-shared 
    1. systemd
    1. systemd-sysv

### INSTALL ISC-DHCP-CLIENT
```sh
apt install --no-install-suggests --no-install-recommends isc-dhcp-client
```
- **Dependencies**
    1. iproute2
    1. isc-dhcp-client
    1. libbpf1
    1. libbsd0
    1. libcap2-bin
    1. libcom-err2
    1. libelf1
    1. libgssapi-krb5-2
    1. libk5crypto3
    1. libkeyutils1
    1. libkrb5-3
    1. libkrb5support0
    1. libmnl0
    1. libtirpc-common
    1. libtirpc3
    1. libxtables12