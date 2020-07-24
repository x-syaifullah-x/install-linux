# SETUP FSTAB

### SETUP FILE FSTAB
```bash
cat << EOF > /etc/fstab
# <FILE SYSTEM>                                 <MOUNT POINT>       <TYPE>        <OPTIONS>                                                                              <DUMP>   <PASS>

# SYSTEM ROOT
UUID=00000000-0000-0000-0000-000000000001        /                   ext4          defaults,noatime,nodiratime,errors=remount-ro,commit=1800                              0        0

# RAMFS AND TMPFS
tmpfs                                            /dev/shm            tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev               0        0
none                                             /media              tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                            0        0
none                                             /mnt                tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                            0        0
none                                             /root               ramfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0700                            0        0
tmpfs                                            /run/lock           tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev,noexec        0        0
none                                             /tmp                ramfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=1777,nosuid,nodev               0        0
none                                             /var/backups        tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                            0        0
none                                             /var/cache          tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                            0        0
none                                             /var/lib/apt        tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                            0        0
none                                             /var/log            tmpfs         defaults,noatime,nodiratime,size=100%,nr_inodes=0,mode=0755                            0        0
EOF
```