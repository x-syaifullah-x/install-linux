## SYSTEM CONFIG
#
#
### Banner
- **Default**
    ```sh
    Debian GNU/Linux 12 \n \l

    ```

- **Local**
    ```sh
    cat << EOF > /etc/issue
    \d \t on \l

    Name    : \n
    Os      : \s \m
    Kernel  : \r
    Version : \v

    EOF
    ```

- **Remote**
    ```sh
    cat << EOF > /etc/issue.net
    \d \t on \l

    Name    : \n
    Os      : \s \m
    Kernel  : \r
    Version : \v

    EOF
    ```

### Timezone
- **Interactive**
    ```sh
    dpkg-reconfigure tzdata
    ```

- **Non Interactive**
    ```sh
    ln -fsv /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
    ```

### SETUP TIME USE BIOS
```sh
cat << EOF > /etc/adjtime 
0.0 0 0
0
LOCAL
EOF
```