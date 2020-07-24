# INSTALL INIT

### INSTALL INIT
```bash
apt install --no-install-recommends --no-install-suggests init
```
- **Dependencies**
    1. dmsetup
    1. init
    1. libapparmor1
    1. libargon2-1
    1. libcryptsetup12
    1. libdevmapper1.02.1
    1. libfdisk1
    1. libip4tc2
    1. libjson-c5
    1. libsystemd-shared
    1. systemd
    1. systemd-sysv

 dmsetup init libapparmor1 libargon2-1 libcryptsetup12 libdevmapper1.02.1 libfdisk1 libip4tc2 libjson-c5 libsystemd-shared systemd systemd-sysv

### DISABLE SYSTEM SERVICES
```bash
systemctl disable apt-daily.timer apt-daily-upgrade.timer e2scrub_all.timer e2scrub_reap.service remote-fs.target dpkg-db-backup.timer fstrim.timer systemd-pstore.service
```

### SETUP LOGIND CONF
- **Change Runtime Directory Size**
    ```bash
    sed -i -e 's/#RuntimeDirectorySize=10%/RuntimeDirectorySize=100%/' /etc/systemd/logind.conf
    ```