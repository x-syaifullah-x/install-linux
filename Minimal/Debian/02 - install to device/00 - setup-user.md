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
```bash
useradd xxx --shell /bin/bash --home-dir /home/xxx --create-home
```
- **Setup Password**

  - **With Password**
      ```bash
      passwd xxx
      ```

  - **Without Password**
    ```bash
    passwd -d xxx
    ```

### SETUP SUDO
- **Install Sudo**
  ```bash
  apt install --no-install-recommends --no-install-suggests sudo
  ```
  ```
  The following NEW packages will be installed:
    sudo
  0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
  Need to get 1,889 kB of archives.
  After this operation, 6,199 kB of additional disk space will be used.
  ```

- **Enable Sudo For User**
  ```bash
  usermod -aG sudo xxx
  ```