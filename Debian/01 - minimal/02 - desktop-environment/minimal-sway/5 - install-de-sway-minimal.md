# DESKTOP ENVIRONMENT SWAY

### INSTALL SWAY
```bash
apt install --no-install-suggests --no-install-recommends sway
```
```
The following NEW packages will be installed:
  dbus dbus-bin dbus-daemon dbus-session-bus-common dbus-system-bus-common fontconfig fontconfig-config
  fonts-dejavu-core libbrotli1 libcairo2 libdatrie1 libdbus-1-3 libdeflate0 libdrm-amdgpu1 libdrm-common libdrm-intel1
  libdrm-nouveau2 libdrm-radeon1 libdrm2 libduktape207 libedit2 libegl-mesa0 libegl1 libevdev2 libexpat1
  libfontconfig1 libfreetype6 libfribidi0 libgbm1 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-common libgl1-mesa-dri
  libglapi-mesa libgles2 libglib2.0-0 libglvnd0 libgraphite2-3 libgudev-1.0-0 libharfbuzz0b libicu72 libinput-bin
  libinput10 libjbig0 libjpeg62-turbo liblerc4 libllvm15 libmtdev1 libpam-systemd libpango-1.0-0 libpangocairo-1.0-0
  libpangoft2-1.0-0 libpciaccess0 libpixman-1-0 libpng16-16 libpolkit-agent-1-0 libpolkit-gobject-1-0 libseat1
  libsensors-config libsensors5 libthai-data libthai0 libtiff6 libwacom-common libwacom9 libwayland-client0
  libwayland-cursor0 libwayland-server0 libwebp7 libwlroots10 libx11-6 libx11-data libx11-xcb1 libxau6
  libxcb-composite0 libxcb-dri2-0 libxcb-dri3-0 libxcb-icccm4 libxcb-present0 libxcb-randr0 libxcb-render-util0
  libxcb-render0 libxcb-res0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 libxcb-xinput0 libxcb1 libxdmcp6 libxext6
  libxkbcommon0 libxml2 libxrender1 libxshmfence1 libz3-4 polkitd sgml-base shared-mime-info sway swaybg xkb-data
  xml-core
0 upgraded, 101 newly installed, 0 to remove and 0 not upgraded.
Need to get 64.9 MB of archives.
After this operation, 258 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```
---

### INSTALL FOOT
```bash
apt install --no-install-suggests --no-install-recommends foot
```
```
The following NEW packages will be installed:
  fontconfig-config fonts-dejavu-core foot foot-terminfo libbrotli1 libexpat1 libfcft4 libfontconfig1 libfreetype6
  libglib2.0-0 libgraphite2-3 libharfbuzz0b libpixman-1-0 libpng16-16 libutf8proc2 libwayland-client0
  libwayland-cursor0 libxkbcommon0 xkb-data
0 upgraded, 19 newly installed, 0 to remove and 0 not upgraded.
Need to get 8,095 kB of archives.
After this operation, 23.5 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```
---

### INSTALL XWAYLAND
```bash
apt install --no-install-suggests --no-install-recommends xwayland
```
```
The following NEW packages will be installed:
  libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libedit2 libepoxy0 libfontenc1
  libgbm1 libgl1 libgl1-mesa-dri libglapi-mesa libglvnd0 libglx-mesa0 libglx0 libice6 libicu72 libllvm15 libpciaccess0
  libsensors-config libsensors5 libsm6 libwayland-server0 libx11-6 libx11-data libx11-xcb1 libxau6 libxaw7
  libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0
  libxcb1 libxcvt0 libxdmcp6 libxext6 libxfixes3 libxfont2 libxkbfile1 libxml2 libxmu6 libxpm4 libxrandr2 libxrender1
  libxshmfence1 libxt6 libxxf86vm1 libz3-4 x11-common x11-xkb-utils xserver-common xwayland
0 upgraded, 57 newly installed, 0 to remove and 0 not upgraded.
Need to get 55.6 MB of archives.
After this operation, 224 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```
---

### INSTALL DBUS-X11
```bash
apt install --no-install-suggests --no-install-recommends dbus-x11
```
```
The following NEW packages will be installed:
  dbus-bin dbus-daemon dbus-session-bus-common dbus-x11 libdbus-1-3
0 upgraded, 5 newly installed, 0 to remove and 0 not upgraded.
Need to get 659 kB of archives.
After this operation, 1,336 kB of additional disk space will be used.
Do you want to continue? [Y/n]
```
---

### SETUP LOGIND CONF
```bash
nano /etc/systemd/logind.conf
```
```
RuntimeDirectorySize=100%
```
---

### INSTALL SUDO
```bash
apt --no-install-suggests --no-install-recommends install sudo
```
```
The following NEW packages will be installed:
  sudo
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,889 kB of archives.
After this operation, 6,199 kB of additional disk space will be used.
Do you want to continue? [Y/n]
```
### SETUP SUDO
```bash
nano /etc/sudoers.d/no_password
```
```
xxx ALL=(ALL:ALL) NOPASSWD:ALL
```
---

### ADD USER xxx
```bash
useradd xxx --shell /bin/bash --home-dir /home/xxx
passwd xxx
usermod -aG sudo xxx
```
---

### SETTING TOUCHPAD
```bash
cp -rf /etc/sway/config /home/xxx/.config/sway/config
```
```bash
nano /home/xxx/.config/sway/config
```
```
input "2:7:SynPS/2_Synaptics_TouchPad" {
	dwt enabled
	tap enabled
	natural_scroll disabled
	scroll_method edge
	middle_emulation disabled
	accel_profile "flat"
	pointer_accel 0.5
	left_handed enabled
}
```
---