# INSTALL INIT

### INSTALL INIT

```bash
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

### DISABLE SYSTEMD SERVICES

- **Default Systemd Active**
    - apt-daily.timer
    - apt-daily-upgrade.timer
    - dpkg-db-backup.timer
    - e2scrub_all.timer
    - e2scrub_reap.service
    - fstrim.timer
    - getty@.service
    - remote-fs.target
    - systemd-pstore.service

- **Disable Systemd Active**
    ```bash
    systemctl disable apt-daily.timer apt-daily-upgrade.timer e2scrub_all.timer e2scrub_reap.service remote-fs.target dpkg-db-backup.timer fstrim.timer systemd-pstore.service
    ```

### SETUP LOGIND CONF

- **Change Runtime Directory Size**
    
    - Default
        
        ```bash
        #RuntimeDirectorySize=10%
        ```
    
    - Increase the value to 100%

        ```bash
        sed -i -e 's/#RuntimeDirectorySize=10%/RuntimeDirectorySize=100%/' /etc/systemd/logind.conf
        ```
    - Restore
        
        ```bash
        sed -i -e 's/RuntimeDirectorySize=100%/#RuntimeDirectorySize=10%/' /etc/systemd/logind.conf
        ```