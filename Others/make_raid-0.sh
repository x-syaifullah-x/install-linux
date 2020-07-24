MD_X=md1
DEVICES=(/dev/sdaX /dev/sdbX)
NUMBER_OF_DEVICES=${#DEVICES[@]}

sudo mdadm --verbose --stop /dev/$MD_X

# CREATE RAID 0
sudo mdadm --verbose --create /dev/$MD_X --homehost=raid --name=0 --level=0 --chunk=256 --raid-devices=$NUMBER_OF_DEVICES "${DEVICES[@]}"

# DETAIL RAID
sudo mdadm --detail /dev/$MD_X

# FORMAT TO EXT4
sudo mkfs.ext4 /dev/$MD_X -v -U 00000000-0000-0000-0000-000000000001 -L raid-0 -m 0 -O ^has_journal -F

# ADDED DEFAULT MOUNT OPTIONS
sudo tune2fs /dev/$MD_X -o discard,journal_data_writeback,nobarrier

sudo e2fsck /dev/$MD_X && sudo e2fsck /dev/$MD_X -f && sudo e2fsck /dev/$MD_X -F

# CHECK
sudo tune2fs -l /dev/$MD_X
