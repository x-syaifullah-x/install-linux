# SETUP USER

### SETUP USER ROOT

- **Set Password**

  - **With Password**
      ```bash
      passwd root
      ```

  - **Without Password**
    ```bash
    passwd -d root
    ```

### CREATE NEW USER
- **ENV**
  ```bash
  _USER_NAME=xxx
  ```

- **Create User**
  ```bash
  useradd $_USER_NAME --shell /bin/bash --home-dir /home/${_USER_NAME} --create-home
  ```

- **Setup Password**

  - **With Password**
      ```bash
      passwd $_USER_NAME
      ```

  - **Without Password**
    ```bash
    passwd -d $_USER_NAME
    ```

### SETUP SUDO

- **Install Sudo**
  ```bash
  apt install --no-install-recommends --no-install-suggests sudo
  ```
  1. sudo    

- **Enable Sudo For User**
  ```bash
  usermod -aG sudo $_USER_NAME
  ```

### SETUP TTY
- **Default**
  ```bash
  ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear - $TERM
  ```

- **Disable Hostname**

  - **value**
      ```bash
      ExecStart=-/sbin/agetty --nohostname -o '-p -- \\u' --noclear - $TERM
      ```

  - **Change**
      ```bash
      sed -i -e 's/ExecStart=-.*$/ExecStart=-\/sbin\/agetty --nohostname -o '\''-p -- \\\\u'\'' --noclear - \$TERM/' /usr/lib/systemd/system/getty@.service
      ```

- **Auto Login**
  - **value**
      ```bash
      ExecStart=-/sbin/agetty --autologin xxx --skip-login --noclear - $TERM
      ```
      
  - **Change**
      ```bash
      sed -i -e 's/ExecStart=-.*$/ExecStart=-\/sbin\/agetty --autologin $_USER_NAME --skip-login --noclear - \$TERM/' /usr/lib/systemd/system/getty@.service
      ```