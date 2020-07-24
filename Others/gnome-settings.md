# GNOME SETTINGS

### CHANGE BACKGROUND
```bash
gsettings set org.gnome.desktop.background picture-uri 'file:///home/xxx/.local/share/backgrounds/bg.png'
gsettings set org.gnome.desktop.background picture-uri-dark 'file:///home/xxx/.local/share/backgrounds/bg.png'
gsettings zet org.gnome.desktop.background picture-options 'zoom'
```

### SET FONT
```bash
gsettings set org.gnome.desktop.interface document-font-name 'System-ui 9'
gsettings set org.gnome.desktop.interface font-name 'System-ui Bold 9'
gsettings set org.gnome.desktop.interface monospace-font-name 'Monospace 8'
```

### SET CLOCK
```bash
gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface clock-show-date false
gsettings set org.gnome.desktop.interface clock-show-weekday false
gsettings set org.gnome.desktop.interface clock-show-seconds true
```

### ENABLE CENTER NEW WINDOWS
```bash
gsettings set org.gnome.mutter center-new-windows true
```
w
### DISABLE DYNAMIC WORKSPACES
```bash
gsettings set org.gnome.shell.overrides dynamic-workspaces false
gsettings set org.gnome.mutter          dynamic-workspaces false
```

### SET NUMBER WORKSPACES
```bash
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
```