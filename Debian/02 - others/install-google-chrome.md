# INSTALL GOOGLE CHROME

```bash
sudo cp -rf files/etc/apt/sources.list.d/google-chrome.list /etc/apt/sources.list.d
```

```bash
sudo cp -rf files/etc/apt/trusted.gpg.d/google-chrome.gpg /etc/apt/trusted.gpg.d
```

```bash
sudo apt update
```

```bash
sudo apt install --no-install-suggests --no-install-recommends ca-certificates fonts-liberation google-chrome-stable libu2f-udev openssl wget xdg-utils
```