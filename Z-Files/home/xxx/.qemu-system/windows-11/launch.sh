#!/bin/bash

set -Eeuxo pipefail

MACHINE_NAME="Windows-11"
QEMU_IMG="/home/xxx/.qemu-system/windows-11/${MACHINE_NAME}.img"
SSH_PORT="5555"
OVMF_CODE="/usr/share/OVMF/OVMF_CODE_4M.ms.fd"
OVMF_VARS_ORIG="/usr/share/OVMF/OVMF_VARS_4M.ms.fd"
OVMF_VARS="$HOME/.cache/$(basename "${OVMF_VARS_ORIG}")"

if [ ! -e "${QEMU_IMG}" ]; then
        qemu-img create -f qcow2 "${QEMU_IMG}" 100G
fi

# if [ ! -e "${OVMF_VARS}" ]; then
#         cp "${OVMF_VARS_ORIG}" "/home/xxx/.cache/${OVMF_VARS}"
# fi
cp "${OVMF_VARS_ORIG}" "${OVMF_VARS}"

qemu-system-x86_64 \
        -enable-kvm \
        -cpu host -smp $(nproc) -m 6144 \
        -object rng-random,filename=/dev/urandom,id=rng0 \
        -device virtio-rng-pci,rng=rng0 \
        -name "${MACHINE_NAME}" \
        -drive file="${QEMU_IMG}",format=qcow2 \
        -vga virtio \
        -machine q35,smm=on \
        -global driver=cfi.pflash01,property=secure,value=on \
        -drive if=pflash,format=raw,unit=0,file="${OVMF_CODE}",readonly=on \
        -drive if=pflash,format=raw,unit=1,file="${OVMF_VARS}" \
        -drive file=/dev/sdb,format=raw,media=disk \
        -monitor stdio \
        $@

        # -drive file=/dev/sdd,format=raw -usb -device usb-host,hostbus=3,hostaddr=3 \
        # -audiodev pa,id=pa,server=unix:${XDG_RUNTIME_DIR}/pulse/native,out.stream-name=foobar,in.stream-name=foobar -device intel-hda -device hda-duplex,audiodev=pa,mixer=off \
        # -device intel-hda -device hda-duplex \
        # -virtfs local,path=/tmp,mount_tag=shared_folder,security_model=passthrough,id=shared_folder \
