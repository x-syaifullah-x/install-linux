# INSTALL ZRAM

### ADDED ZRAM CONF MODULES-LOAD.D
```bash
sudo editor $ROOT_DIR/etc/modules-load.d/zram.conf
```
```
zram
```
---

### ADDED ZRAM CONF MODPROBE.D
```bash
sudo editor $ROOT_DIR/etc/modprobe.d/zram.conf
```
```
options zram num_devices=1
```
---

### ADDED ZRAM RULES RULES.D
```bash
sudo editor $ROOT_DIR/etc/udev/rules.d/zram.rules
```
```bash
# /etc/modprobe.d/zram.conf >> options zram num_devices=1
KERNEL=="zram0", SUBSYSTEM=="block", ACTION=="add", ATTR{initstate}=="0", ATTR{comp_algorithm}="lz4", ATTR{disksize}="15830M", RUN="/sbin/mkswap -U clear /dev/zram0", TAG+="systemd"
```
---

### ADDED VM SWAPPINESS
```bash
sudo editor $ROOT_DIR/etc/sysctl.d/vm-swappiness.conf
```
```
#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables.
# See sysctl.conf (5) for information.
#
vm.swappiness=1
```
---

### ENBALE ZRAM IN FSTAB
```bash
sudo editor $ROOT_DIR/etc/fstab
```
```SH
# ZRAM
/dev/zram0  none    swap    defaults,pri=100    0       0
```
----