# EIO SCHEDULER

### ADDED IO-SCHEDULER.RULES
```bash
cat << "EOF" > /etc/udev/rules.d/io-scheduler.rules
# Command to check :    cat /sys/block/sdX/queue/scheduler
# SSD=(/sys/block/sdX/queue/rotationall == 0)
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
EOF
```