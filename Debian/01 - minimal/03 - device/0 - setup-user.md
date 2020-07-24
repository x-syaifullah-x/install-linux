# SETUP USER

#### CREATE USER
```bash
useradd xxx --shell /bin/bash --home-dir /home/xxx --create-home
```
#### SETUP PASSWORD
```bash
passwd xxx
```
```
Sy@ifu11@h
```
---

### INSTALL SUDO
```bash
apt install --no-install-suggests --no-install-recommends sudo
```
```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  sudo
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,889 kB of archives.
After this operation, 6,199 kB of additional disk space will be used.
```
---

### SETUP SUDO FOR USR
```bash
usermod -aG sudo xxx
```
---

### SETUP SUDO FOR USER xxx WITHOUT PASSWORD
```bash
sudo editor /etc/sudoers.d/no_password
```
```
xxx ALL=(ALL:ALL) NOPASSWD:ALL
```
---