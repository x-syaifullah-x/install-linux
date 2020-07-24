# DESKTOP ENVIRONMENT GNOME MINIMAL

#### INSTALL GNOME-SESSION
```bash
apt install --no-install-suggests --no-install-recommends gnome-session
```
```
The following NEW packages will be installed:
  adwaita-icon-theme at-spi2-common bubblewrap dbus dbus-bin dbus-daemon dbus-session-bus-common
  dbus-system-bus-common dbus-user-session dconf-gsettings-backend dconf-service dictionaries-common emacsen-common
  evolution-data-server-common fontconfig fontconfig-config fonts-dejavu-core fuse3 geocode-glib-common
  gir1.2-accountsservice-1.0 gir1.2-adw-1 gir1.2-atk-1.0 gir1.2-atspi-2.0 gir1.2-freedesktop gir1.2-gck-1 gir1.2-gcr-3
  gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-gdm-1.0 gir1.2-geoclue-2.0 gir1.2-glib-2.0
  gir1.2-gnomebluetooth-3.0 gir1.2-gnomedesktop-3.0 gir1.2-graphene-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0
  gir1.2-gtk-4.0 gir1.2-gweather-4.0 gir1.2-harfbuzz-0.0 gir1.2-ibus-1.0 gir1.2-javascriptcoregtk-4.1 gir1.2-json-1.0
  gir1.2-mutter-11 gir1.2-nm-1.0 gir1.2-nma-1.0 gir1.2-pango-1.0 gir1.2-polkit-1.0 gir1.2-rsvg-2.0 gir1.2-soup-3.0
  gir1.2-upowerglib-1.0 gir1.2-webkit2-4.1 glib-networking glib-networking-common glib-networking-services
  gnome-backgrounds gnome-bluetooth-3-common gnome-desktop3-data gnome-session gnome-session-bin gnome-session-common
  gnome-settings-daemon gnome-settings-daemon-common gnome-shell gnome-shell-common gsettings-desktop-schemas
  gstreamer1.0-pipewire gstreamer1.0-plugins-base gstreamer1.0-plugins-good gtk-update-icon-cache hicolor-icon-theme
  hunspell-en-us iso-codes libaa1 libabsl20220623 libaccountsservice0 libadwaita-1-0 libaom3 libarchive13 libasound2
  libasound2-data libaspell15 libasyncns0 libatk-bridge2.0-0 libatk1.0-0 libatomic1 libatspi2.0-0 libavahi-client3
  libavahi-common-data libavahi-common3 libavc1394-0 libavif15 libbluetooth3 libbrotli1 libcaca0 libcairo-gobject2
  libcairo-script-interpreter2 libcairo2 libcamel-1.2-64 libcanberra-gtk3-0 libcanberra0 libcdparanoia0
  libcloudproviders0 libcolord2 libcups2 libdatrie1 libdav1d6 libdbus-1-3 libdconf1 libdeflate0 libdrm-amdgpu1
  libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libdv4 libdw1 libecal-2.0-2 libedataserver-1.2-27
  libedit2 libegl-mesa0 libegl1 libenchant-2-2 libepoxy0 libevdev2 libexpat1 libflac12 libfontconfig1 libfontenc1
  libfreeaptx0 libfreetype6 libfribidi0 libfuse3-3 libgav1-1 libgbm1 libgck-1-0 libgcr-base-3-1 libgcr-ui-3-1
  libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-common libgdm1 libgeoclue-2-0 libgeocode-glib-2-0 libgirepository-1.0-1
  libgjs0g libgl1 libgl1-mesa-dri libglapi-mesa libgles2 libglib2.0-0 libglib2.0-bin libglib2.0-data libglvnd0
  libglx-mesa0 libglx0 libgnome-autoar-0-0 libgnome-bg-4-2 libgnome-bluetooth-3.0-13 libgnome-desktop-3-20
  libgnome-desktop-4-2 libgpm2 libgraphene-1.0-0 libgraphite2-3 libgssdp-1.6-0 libgstreamer-gl1.0-0
  libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-common libgtk-4-1
  libgtk-4-common libgudev-1.0-0 libgupnp-1.6-0 libgupnp-igd-1.0-4 libgweather-4-0 libgweather-4-common
  libharfbuzz-icu0 libharfbuzz0b libhunspell-1.7-0 libhyphen0 libibus-1.0-5 libical3 libice6 libicu72 libiec61883-0
  libinput-bin libinput10 libjack-jackd2-0 libjavascriptcoregtk-4.1-0 libjbig0 libjpeg62-turbo libjson-glib-1.0-0
  libjson-glib-1.0-common liblc3-0 liblcms2-2 libldacbt-abr2 libldacbt-enc2 liblerc4 liblilv-0-0 libllvm15 libltdl7
  liblua5.3-0 liblzo2-2 libmanette-0.2-0 libmm-glib0 libmozjs-102-0 libmp3lame0 libmpg123-0 libmtdev1 libmutter-11-0
  libncurses6 libncursesw6 libnghttp2-14 libnice10 libnm0 libnma-common libnma0 libnotify4 libnsl2 libnspr4 libnss3
  libogg0 libopus0 liborc-0.4-0 libpam-systemd libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpangoxft-1.0-0
  libpciaccess0 libpipewire-0.3-0 libpipewire-0.3-modules libpixman-1-0 libpng16-16 libpolkit-agent-1-0
  libpolkit-gobject-1-0 libproc2-0 libproxy1v5 libpsl5 libpulse-mainloop-glib0 libpulse0 libpython3-stdlib
  libpython3.11-minimal libpython3.11-stdlib librav1e0 libraw1394-11 libreadline8 librsvg2-2 libsamplerate0 libsbc1
  libsecret-1-0 libsecret-common libsensors-config libsensors5 libserd-0-0 libshout3 libsm6 libsndfile1 libsord-0-0
  libsoup-3.0-0 libsoup-3.0-common libspa-0.2-bluetooth libspa-0.2-modules libspeex1 libsqlite3-0 libsratom-0-0
  libstartup-notification0 libsvtav1enc1 libtag1v5 libtag1v5-vanilla libtdb1 libtext-iconv-perl libthai-data libthai0
  libtheora0 libtiff6 libtwolame0 libunwind8 libupower-glib3 libusb-1.0-0 libv4l-0 libv4lconvert0 libva-drm2 libva2
  libvisual-0.4-0 libvorbis0a libvorbisenc2 libvorbisfile3 libvpx7 libvulkan1 libwacom-common libwacom9 libwavpack1
  libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 libwebkit2gtk-4.1-0 libwebp7 libwebpdemux2
  libwebrtc-audio-processing1 libwireplumber-0.4-0 libwoff1 libx11-6 libx11-data libx11-xcb1 libxau6 libxaw7
  libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-render0 libxcb-res0 libxcb-shm0
  libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xkb1 libxcb1 libxcomposite1 libxcursor1 libxcvt0 libxdamage1
  libxdmcp6 libxext6 libxfixes3 libxfont2 libxft2 libxi6 libxinerama1 libxkbcommon-x11-0 libxkbcommon0 libxkbfile1
  libxkbregistry0 libxml2 libxmu6 libxpm4 libxrandr2 libxrender1 libxshmfence1 libxslt1.1 libxt6 libxtst6 libxxf86vm1
  libyuv0 libz3-4 media-types mutter-common pipewire pipewire-alsa pipewire-audio pipewire-bin pipewire-pulse procps
  python3 python3-minimal python3.11 python3.11-minimal readline-common shared-mime-info sound-theme-freedesktop
  upower wireplumber x11-common x11-xkb-utils xdg-dbus-proxy xdg-desktop-portal xdg-desktop-portal-gnome
  xdg-desktop-portal-gtk xkb-data xserver-common xwayland
0 upgraded, 375 newly installed, 0 to remove and 0 not upgraded.
Need to get 219 MB of archives.
After this operation, 789 MB of additional disk space will be used.
```
---

#### INSTALL GNOME-ICON-THEME
```bash
apt install --no-install-suggests --no-install-recommends gnome-icon-theme
```
```
The following NEW packages will be installed:
  gnome-icon-theme librsvg2-common
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 9,888 kB of archives.
After this operation, 15.6 MB of additional disk space will be used.
```
---

#### INSTALL GNOME-TERMINAL
```bash
apt install --no-install-suggests --no-install-recommends gnome-terminal
```
```
The following NEW packages will be installed:
  gnome-terminal gnome-terminal-data libvte-2.91-0 libvte-2.91-common
0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
Need to get 2,620 kB of archives.
After this operation, 11.7 MB of additional disk space will be used.
```
---

### INSTALL POLKITD FOR SUPPORT MENU REBOOT
```bash
apt install --no-install-suggests --no-install-recommends polkitd
```
```
The following NEW packages will be installed:
  libduktape207 polkitd sgml-base xml-core
0 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
Need to get 285 kB of archives.
After this operation, 995 kB of additional disk space will be used.
```
---

### INSTALL RTKIT FOR SUPPORT PIPEWIRE
```bash
apt install --no-install-suggests --no-install-recommends rtkit
```
```
The following NEW packages will be installed:
  rtkit
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 33.3 kB of archives.
After this operation, 144 kB of additional disk space will be used.
```
---

### INSTALL PIPEWIRE-JACK
```bash
apt install --no-install-suggests --no-install-recommends libspa-0.2-jack pipewire-jack
```
```
The following NEW packages will be installed:
  libspa-0.2-jack pipewire-jack
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 179 kB of archives.
After this operation, 798 kB of additional disk space will be used.
```

- **Setup Configuration**
  ```bash
  ln -sf /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d  && ldconfig
  ```

- **Test Pipewire Jack**

  - **Install jack-tools**
    ```bash
    apt install --no-install-suggests --no-install-recommends jack-tools
    ```

  - **Running jack_simple_client**
    ```bash
    jack_simple_client
    ```