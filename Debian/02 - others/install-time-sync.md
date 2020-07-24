### Install systemd-timesyncd
```bash
apt install --no-install-suggests --no-install-recommends systemd-timesyncd
```

### System clock synchronized
```bash
timedatectl set-local-rtc 0
timedatectl set-ntp true
```