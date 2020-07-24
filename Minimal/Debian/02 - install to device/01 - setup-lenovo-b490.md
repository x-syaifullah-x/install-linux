# SETUP FOR LENOVO-B490

### INSTALL FIRMWARE REALTEK FOR LAN DRIVER
```bash
apt install --no-install-suggests --no-install-recommends firmware-realtek
```

### INSTALL FIRMWARE BRCM FOR WIFI DRIVER
```bash
apt install --no-install-suggests --no-install-recommends firmware-brcm80211
```

### FIX MIC HEANDSEAT NOT WORK
```bash
cat << "EOF" > /etc/modprobe.d/alsa-base.conf
options snd-hda-intel model=dell-headset-multi
EOF
```