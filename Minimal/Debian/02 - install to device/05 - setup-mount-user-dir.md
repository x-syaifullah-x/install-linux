# SETUP MOUNT USER DIR

### ENV
```bash
FILE_X_MOUNT_USER_DIR=/sbin/x-mount-user-dir
SERVICE_NAME=x-mount-user-dir.service
```

### CREATE SCRIPT
```bash
cat << "EOF" > $FILE_X_MOUNT_USER_DIR
#! /bin/bash

_LOG_PATH="/dev/null"
if [ "$_USER" = "" ]; then
  echo "Please set ENV _USER=" > $_LOG_PATH
  exit 0
fi
if [ "$_USER_HOME" = "" ]; then
  echo "Please set ENV _USER_HOME=" > $_LOG_PATH
  exit 0
fi
_PROPERTIES="${_PROPERTIES:-${_USER_HOME}/.config/x-mount-user-dir.properties}"
if [ ! -f "$_PROPERTIES" ]; then
  echo "File $_PROPERTIES not found" > $_LOG_PATH
  exit 0
fi
_OVERLAY_DIR="${_OVERLAY_DIR:-/run/x-mount-user-dir}"
while read -r _properties; do
  # IS_BLANK_TEXT
  [[ -z "$_properties" ]] && continue
  # IS_COMMENT
  [[ "${_properties:0:1}" == "#" ]] && continue
  # INITIALIZATION $_PATH, $_TYPE
  _PROPS=($_properties)
  _PATH="${_PROPS[0]}"
  _TYPE="${_PROPS[1]}"
  # VALIDATION $_PATH
  if [[ "$_PATH" != "$_USER_HOME"*  ]]; then
    echo "$_PATH. You can only mount directories in folders $_USER_HOME, Please check the config in $_PROPERTIES" > $_LOG_PATH
    continue
  fi
  # CHECK
  if [ "$1" == "check" ]; then
    ! grep -qs $_PATH /proc/mounts && echo "Not Mounted $_PATH"
    continue
  fi
  # ENABLE
  if [ "$1" == "enable" ]; then
    grep -qs $_PATH /proc/mounts && continue
    if [[ "$_TYPE" == "tmpfs" ]]; then
      if [ -d "$_PATH" ]; then
        for i in $(ls -A $_PATH); do
          rm -rfv "$_PATH/$i" > $_LOG_PATH
        done
      else
        mkdir -pv $_PATH > $_LOG_PATH
        chown $_USER:$_USER $_PATH > $_LOG_PATH
      fi
      mount -v -t tmpfs none -o defaults,relatime,noatime,nodiratime,size=100%,uid=$_USER,gid=$_USER,nr_inodes=0,mode=0755,inode64 $_PATH > $_LOG_PATH
    elif [[ "$_TYPE" == "overlay" ]]; then
      LOWER_DIR=$_PATH
      [ ! -d $LOWER_DIR ] && mkdir -p $LOWER_DIR && chown -R $_USER:$_USER $LOWER_DIR
      UPPER_DIR="$_OVERLAY_DIR/upper_dir$LOWER_DIR"
      [ ! -d $UPPER_DIR ] && mkdir -p $UPPER_DIR && chown -R $_USER:$_USER $UPPER_DIR
      WORK_DIR="$_OVERLAY_DIR/work_dir$LOWER_DIR"
      [ ! -d $WORK_DIR ] && mkdir -p $WORK_DIR && chown -R $_USER:$_USER $WORK_DIR
      TARGET_DIR=$_PATH
      [ ! -d $TARGET_DIR ] && mkdir -p $TARGET_DIR && chown -R $_USER:$_USER $TARGET_DIR
      mount -v -t overlay overlay -o defaults,noatime,nodiratime,lowerdir=$LOWER_DIR,upperdir=$UPPER_DIR,workdir=$WORK_DIR $TARGET_DIR > $_LOG_PATH
    fi
    continue
  fi
  # DISBLE
  if [ "$1" == "disable" ]; then
    if [[ "$_TYPE" == "overlay" ]]; then
      rm -rfv $_OVERLAY_DIR/upper_dir$_PATH $_OVERLAY_DIR/work_dir$_PATH > $_LOG_PATH
    fi
    umount -v --lazy $_PATH > $_LOG_PATH
    continue
  fi
  echo "check | start | stop"
  break
done < $_PROPERTIES
EOF
```

### SET PERMISSION
```bash
chmod +x $FILE_X_MOUNT_USER_DIR
```

### CREATE SYSTEMD
```bash
cat << EOF > /lib/systemd/system/$SERVICE_NAME
[Unit]
Description=User Mount

[Service]
Environment="_USER=xxx"
Environment="_USER_HOME=/home/xxx"
Environment="_PROPERTIES="
Environment="_OVERLAY_DIR="
ExecStart=$FILE_X_MOUNT_USER_DIR enable
RemainAfterExit=true
ExecStop=$FILE_X_MOUNT_USER_DIR disable

[Install]
WantedBy=multi-user.target
EOF
```

### EXAMPLE CONFIG
```bash
cat << EOF > ${_USER_HOME}/.config/x-mount-user-dir.properties
#
# PATH	:	/home/xxx/any_dir
#
# TYPE	:	overlay | tmpfs
#
# <PATH>                                                       <TYPY>
/home/xxx/Screencasts                                           tmpfs
/home/xxx/Screenshots                                           tmpfs
/home/xxx/go                                                    tmpfs
/home/xxx/.android/avd                                          tmpfs
/home/xxx/.android/cache                                        tmpfs
/home/xxx/.android/studio/config/tasks                          tmpfs
/home/xxx/.android/studio/config/workspace                      tmpfs
/home/xxx/.cache                                                tmpfs
/home/xxx/.config/chromium                                      overlay
/home/xxx/.config/Code                                          overlay
/home/xxx/.config/GIMP                                          tmpfs
/home/xxx/.config/google-chrome                                 overlay
/home/xxx/.config/go                                            tmpfs
/home/xxx/.config/pulse                                         tmpfs
/home/xxx/.dart                                                 tmpfs
/home/xxx/.dartServer                                           tmpfs
/home/xxx/.dart-tool                                            tmpfs
/home/xxx/.dotnet                                               tmpfs
/home/xxx/.files/Linux/SDK/Android/.downloadIntermediates       tmpfs
/home/xxx/.files/Linux/SDK/Android/.temp                        tmpfs
/home/xxx/.gradle/android                                       tmpfs
/home/xxx/.gradle/daemon                                        tmpfs
/home/xxx/.gradle/caches/build-cache-1                          tmpfs
/home/xxx/.gradle/jdks                                          tmpfs
/home/xxx/.gradle/kotlin-profile                                tmpfs
/home/xxx/.gradle/native                                        tmpfs
/home/xxx/.gradle/notifications                                 tmpfs
/home/xxx/.gradle/workers                                       tmpfs
/home/xxx/.gradle/.tmp                                          tmpfs
/home/xxx/.java                                                 tmpfs
/home/xxx/.javacpp                                              tmpfs
/home/xxx/.local/share                                          overlay
/home/xxx/.m2                                                   tmpfs
/home/xxx/.npm                                                  tmpfs
/home/xxx/.pki                                                  tmpfs
/home/xxx/.skiko                                                tmpfs
EOF
```

### ENABLE SYSTEMD
```bash
systemctl enable $SERVICE_NAME
```

### REMOVE CONFIGURATION
```bash
systemctl disable --now $SERVICE_NAME
rm -rfv $FILE_X_MOUNT_USER_DIR
rm -rfv /lib/systemd/system/$SERVICE_NAME
```