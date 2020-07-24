# INSTALL IO SCHEDULER

### ADDED IO-SCHEDULER.RULES
```bash
sudo editor $ROOT_DIR/etc/udev/rules.d/io-scheduler.rules
```
```sh
# check /sys/block/sda/queue/scheduler
# queue/rotational == 0 is SSD
ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
```
---