# SETUP OVERLAY SYSTEM

### ENV
```bash
FILE_X_OVERLAY=/sbin/x-overlay
SERVICE_NAME=x-overlay.service
```

### CREATE SCRIPT
```bash
cat << "EOF" > $FILE_X_OVERLAY
#! /bin/bash

OVERLAY_DIR=${OVERLAY_DIR:-"/run/x-overlay"}
LOWER_DIRS=${LOWER_DIRS:-"/boot /etc /opt /srv /usr /var"}
_LOG_PATH=/dev/null

for LOWER_DIR in $LOWER_DIRS; do
  UPPER_DIR="$OVERLAY_DIR/upper_dir$LOWER_DIR"
  WORK_DIR="$OVERLAY_DIR/work_dir$LOWER_DIR"
  TARGET_DIR="$LOWER_DIR"

  if [ "$1" = "check" ]; then
    if ! grep -qs "lowerdir=$LOWER_DIR,upperdir=$UPPER_DIR,workdir=$WORK_DIR" /proc/mounts; then
      echo "IS NOT OVERLAY DIRECOTRY $LOWER_DIR"
    fi
    continue
  fi

  if [ "$1" = "enable" ]; then
    [ ! -d $UPPER_DIR ] && mkdir -p $UPPER_DIR
    [ ! -d $WORK_DIR ] && mkdir -p $WORK_DIR
    if [ -d $LOWER_DIR ]; then
      if ! grep -qs "lowerdir=$LOWER_DIR,upperdir=$UPPER_DIR,workdir=$WORK_DIR" /proc/mounts; then
      	if [ "$TARGET_DIR" == "/var" ]; then
      		cp -rfv --preserve=all $TARGET_DIR/log $UPPER_DIR > $_LOG_PATH
      		rm -rfv $TARGET_DIR/log/* > $_LOG_PATH
      	fi
        mount -t overlay overlay -o defaults,noatime,nodiratime,lowerdir=$LOWER_DIR,upperdir=$UPPER_DIR,workdir=$WORK_DIR $TARGET_DIR > $_LOG_PATH
      fi
    fi
  elif [ "$1" = "disable" ]; then
    if ! grep -qs "lowerdir=$LOWER_DIR,upperdir=$UPPER_DIR,workdir=$WORK_DIR" /proc/mounts; then
      continue
    fi

    umount -v --lazy $TARGET_DIR > $_LOG_PATH
    if [ "$TARGET_DIR" == "/var" ]; then
    	cp -rfv --preserve=all $UPPER_DIR/log $TARGET_DIR > $_LOG_PATH
    fi
    rm -rfv $UPPER_DIR > $_LOG_PATH
    rm -rfv $WORK_DIR > $_LOG_PATH
  fi
done
EOF
```

### SET PERMISSION
```bash
chmod +x $FILE_X_OVERLAY
```

### CREATE SYSTEMD
```bash
cat << EOF > /lib/systemd/system/$SERVICE_NAME
[Unit]
Description=Overlay System

[Service]
ExecStart=$FILE_X_OVERLAY enable
RemainAfterExit=true
ExecStop=$FILE_X_OVERLAY disable

[Install]
WantedBy=multi-user.target
EOF
```

### ENABLE SYSTEMD
```bash
systemctl enable --now $SERVICE_NAME
```

### REMOVE CONFIGURATION
```bash
systemctl disable --now $SERVICE_NAME
rm -rfv $FILE_X_OVERLAY
rm -rfv /lib/systemd/system/$SERVICE_NAME
```