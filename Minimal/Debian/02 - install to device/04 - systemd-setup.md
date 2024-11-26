# SETUP SYSTEMD SERVICE
#
#
### DISABLE SYSTEMD SERVICES
- **Default Systemd Active**
    1. apt-daily-upgrade.timer
    1. dpkg-db-backup.timer
    1. getty@.service
    1. systemd-pstore.service
    1. apt-daily.timer
    1. fstrim.timer
    1. remote-fs.target
- **Disable Systemd Active**
    ```sh
    systemctl disable apt-daily-upgrade.timer dpkg-db-backup.timer systemd-pstore.service remote-fs.target fstrim.timer apt-daily.timer
    ```
### SETUP LOGIND CONF
- **Change Runtime Directory Size**
    - **Default**
        ```sh
        #RuntimeDirectorySize=10%
        ```
    - **Increase the value to 100%**
        ```sh
        sed -i -e 's/#RuntimeDirectorySize=10%/RuntimeDirectorySize=100%/' /etc/systemd/logind.conf
        ```
    - **Restore**
        ```sh
        sed -i -e 's/RuntimeDirectorySize=100%/#RuntimeDirectorySize=10%/' /etc/systemd/logind.conf
        ```
### DISABLE STORAGE JOURNALD
```sh
echo "Storage=none" >> /etc/systemd/journald.conf
```
### MASK SYSTEMD SERVICE
```bash
services=(
    getty-static.service
    kmod-static-nodes.service
    modprobe@dm_mod.service
    modprobe@fuse.service
    modprobe@loop.service
    proc-sys-fs-binfmt_misc.automount
    proc-sys-fs-binfmt_misc.mount
    swap.target
    sys-fs-fuse-connections.mount
    sys-kernel-config.mount
    sys-kernel-debug.mount
    sys-kernel-tracing.mount
    systemd-binfmt.service
    systemd-random-seed.service
    systemd-rfkill.service
    systemd-rfkill.socket
    systemd-tmpfiles-clean.service
    systemd-tmpfiles-clean.timer
    systemd-tmpfiles-setup-dev.service
)
for service in ${services[@]}; do
  ln -fsv /dev/null /etc/systemd/system/$service
done
``