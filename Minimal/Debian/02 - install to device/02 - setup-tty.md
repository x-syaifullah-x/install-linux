# SETUP TTY

### DISABE HOSTNAME ON LOGIN WITH TTY
```bash
sed -i -e 's/ExecStart=-\/sbin\/agetty/ExecStart=-\/sbin\/agetty --nohostname/' /usr/lib/systemd/system/getty@.service
cat /usr/lib/systemd/system/getty@.service | grep '\--nohostname'
```