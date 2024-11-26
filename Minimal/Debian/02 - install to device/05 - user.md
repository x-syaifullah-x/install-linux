# SETUP USER
#
#
### SETUP USER ROOT
- **Set Password**
  - **With Password**
      ```sh
      passwd root
      ```
  - **Without Password**
    ```sh
    passwd -d root
    ```
### CREATE NEW USER
- **ENV**
  ```sh
  _USER_NAME=xxx
  ```
- **Create User**
  ```sh
  useradd $_USER_NAME --shell /bin/bash --home-dir /home/${_USER_NAME} --create-home
  ```
- **Clean User Directory**
  ```sh
  for i in $(ls -A /home/$_USER_NAME); do
   rm -rfv /home/$_USER_NAME/$i
  done
  ```
- **Setup Password**
  - **With Password**
      ```sh
      passwd $_USER_NAME
      ```
  - **Without Password**
    ```sh
    passwd -d $_USER_NAME
    ```
### SETUP TTY
- **Disable Hostname**
  - **value**
      ```sh
      ExecStart=-/sbin/agetty --nohostname -o '-p -- \\u' --noclear - $TERM
      ```
  - **Change**
      ```sh
      sed -i -e 's/ExecStart=-.*$/ExecStart=-\/sbin\/agetty --nohostname -o '\''-p -- \\\\u'\'' --noclear - \$TERM/' /usr/lib/systemd/system/getty@.service
      ```
- **Auto Login TTY_1**
  ```sh
  mkdir -p /etc/systemd/system/getty@tty1.service.d
  cat << EOF > /etc/systemd/system/getty@tty1.service.d/autologin.conf
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty --autologin $_USER_NAME --skip-login --noclear - \$TERM
  Type=idle
  EOF
### SETUP SUDO
- **Install Sudo**
  ```sh
  apt install --no-install-recommends --no-install-suggests sudo
  ```
  1. sudo    
- **Enable Sudo For User**
  ```sh
  usermod -aG sudo $_USER_NAME
  ```

  ### INSTALL DBUS USER SESSION
```sh
apt install --no-install-suggests --no-install-recommends dbus-user-session
```
  1. dbus
  1. dbus-bin
  1. dbus-daemon
  1. dbus-session-bus-common
  1. dbus-system-bus-common
  1. dbus-user-session
  1. libdbus-1-3
  1. libexpat1
  1. libpam-systemd
- **LINK MACHINE ID**
  ```sh
  ln -sfv /etc/machine-id /var/lib/dbus/machine-id
  ```