# INSTALL GOOGLE CHROME

```bash
sudo cp -rf files/etc/apt/sources.list.d/vscode.list /etc/apt/sources.list.d
```

```bash
sudo cp -rf files/etc/apt/trusted.gpg.d/microsoft.gpg /etc/apt/trusted.gpg.d
```

```bash
sudo apt update
```

```bash
sudo apt install --no-install-suggests --no-install-recommends ca-certificates code openssl xdg-utils
```