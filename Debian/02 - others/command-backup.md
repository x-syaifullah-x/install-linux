##### BACKUP COMMAND
```
sudo tar cvjSf backup.tar.bz2 *
sudo tar cfJv backup.tar.xz *
```

##### BACKUP SPLIT
```
gzip -c backup.tar.bz2 | split -b 50000000 --numeric-suffixes=0 --suffix-length=1 - backup.tar.bz2.0
gzip -c backup.tar.xz | split -b 50000000 --numeric-suffixes=0 --suffix-length=1 - backup.tar.xz.0
```

##### RESTORE SPLIT
```
cat backup.tar.bz2.* | zcat > backup.tar.bz2
cat backup.tar.xz.* | zcat > backup.tar.xz
```

##### RESTORE COMMAND
```
tar -xf backup.tar.bz2 -C destination
tar xvf backup.tar.xz -C destination
```