# SETTING AUDIO WITH PACTL

- **Install Pulseaudio Utils**
    ```bash
    sudo apt install --no-install-suggests --no-install-recommends pulseaudio-utils
    ```

- **Setting Input Microphone**
    ```bash
    pactl set-source-port alsa_input.pci-0000_00_1b.0.analog-stereo.2 analog-input-mic
    ```

- **Setting Volume**
    ```bash
    pactl set-source-volume alsa_input.pci-0000_00_1b.0.analog-stereo.4 100000
    ```