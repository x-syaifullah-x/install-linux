# NETWORK TOOLS

### INSTALL ISC-DHCP-CLIENT
```bash
apt install --no-install-suggests --no-install-recommends isc-dhcp-client
```
- **Dependencies**
    1. iproute2
    1. isc-dhcp-client
    1. libbpf1
    1. libbsd0
    1. libcap2-bin
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

### INSTALL WIRELESS-REGDB (For Fix: Error platform regulatory.0: Direct firmware load for regulatory.db failed with error -2)
```bash
apt install --no-install-suggests --no-install-recommends wireless-regdb
```
- **Dependencies**
    1. wireless-regdb