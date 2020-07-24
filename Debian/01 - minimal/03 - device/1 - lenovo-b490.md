# INSTALL FOR LENOVO-B490

### INSTALL FIRMWARE-REALTEK FOR SUPPORT LAN
```bash
apt install --no-install-suggests --no-install-recommends firmware-realtek
```
```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  firmware-realtek
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,491 kB of archives.
After this operation, 7,046 kB of additional disk space will be used.
```
---

### INSTALL WPASUPPLICANT FOR WIFI TOOLS
```bash
apt install --no-install-suggests --no-install-recommends wpasupplicant
```
```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libnl-3-200 libnl-genl-3-200 libnl-route-3-200 libpcsclite1
Suggested packages:
  pcscd wpagui libengine-pkcs11-openssl
The following NEW packages will be installed:
  libnl-3-200 libnl-genl-3-200 libnl-route-3-200 libpcsclite1 wpasupplicant
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,737 kB of archives.
After this operation, 4,942 kB of additional disk space will be used.
Do you want to continue? [Y/n]
```
---

### INSTALL DRIVER WIFI
```bash
apt install --no-install-suggests --no-install-recommends firmware-brcm80211
```
```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  firmware-brcm80211
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 5,356 kB of archives.
After this operation, 18.5 MB of additional disk space will be used.
```
---

### SETUP ALSA FOR AUDIO JACK SUPPORT MIC
```bash
sudo editor $ROOT_DIR/etc/modprobe.d/alsa-base.conf
```
```bash
options snd-hda-intel model=dell-headset-multi
```
---

### INSTALL NANO
```bash
apt install --no-install-suggests --no-install-recommends nano
```
```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Suggested packages:
  hunspell
The following NEW packages will be installed:
  nano
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/689 kB of archives.
After this operation, 2,871 kB of additional disk space will be used.
```
---

## INSTALL GIT
```bash
apt install --no-install-suggests --no-install-recommends git openssh-client
```
```
The following NEW packages will be installed:
  git git-man libcbor0.8 libcurl3-gnutls liberror-perl libfido2-1 libgdbm-compat4 libgdbm6 libldap-2.5-0 libperl5.36
  librtmp1 libsasl2-2 libsasl2-modules-db libssh2-1 openssh-client perl perl-modules-5.36
0 upgraded, 17 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/18.6 MB of archives.
After this operation, 105 MB of additional disk space will be used.
```
---

### DISABLE SERVICE
```bash
systemctl disable apt-daily.timer apt-daily-upgrade.timer dpkg-db-backup.timer e2scrub_all.timer e2scrub_reap.service fstrim.timer remote-fs.target systemd-pstore.service wpa_supplicant.service
```
- apt-daily.timer
- apt-daily-upgrade.timer
- dpkg-db-backup.timer
- e2scrub_all.timer
- e2scrub_reap.service
- fstrim.timer
- remote-fs.target
- systemd-pstore.service
- wpa_supplicant.service
---

### NEW SOURCES LIST
```bash
editor /etc/apt/sources.list
```
```bash
# LOCAL START
deb [trusted=yes] file:/media/xxx/HDD-0/OS/Linux/DEB ./
# LOCAL END

# REMOTE MAIN
#deb http://deb.debian.org/debian bookworm main
# REMOTE END

# REMOTE NON FREE FIRMWARE START
#deb http://deb.debian.org/debian/ bookworm main non-free-firmware
#deb-src http://deb.debian.org/debian/ bookworm main non-free-firmware
#
#deb http://security.debian.org/debian-security bookworm-security main non-free-firmware
#deb-src http://security.debian.org/debian-security bookworm-security main non-free-firmware
#
#deb http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
#deb-src http://deb.debian.org/debian/ bookworm-updates main non-free-firmware
# REMOTE NON FREE FIRMWARE END
```