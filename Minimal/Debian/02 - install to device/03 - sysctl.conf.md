# SYSCTL CONF D
#
#
### VM CONF
```sh
cat << EOF >> /etc/sysctl.d/proc_sys.conf
kernel.printk             = 0 4 1 7
vm.swappiness             = 1
vm.dirty_ratio            = 1
vm.dirty_background_ratio = 1
vm.vfs_cache_pressure     = 500
EOF
```