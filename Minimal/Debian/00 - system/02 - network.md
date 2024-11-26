# INSTALL PACKAGE NETWORK
#
#
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
### UPDATE HOSTNAME
```sh
cat << EOF | sudo tee $ROOTFS_DIR/etc/hostname
x-host
EOF
```
### UPDATE HOSTS
```sh
cat << EOF | sudo tee $ROOTFS_DIR/etc/hosts
127.0.0.1       localhost $(cat /etc/hostname) $(cat /etc/hostname).co.id
::1             localhost $(cat /etc/hostname) $(cat /etc/hostname).co.id ip6-localhost ip6-loopback
fe00::0         ip6-localnet
ff00::0         ip6-mcastprefix
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
EOF
```
### UPDATE RESOLV CONF
```sh
cat << EOF | sudo tee $ROOTFS_DIR/etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF
```