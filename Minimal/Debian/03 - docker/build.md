# BUILD DOCKER IMAGE
#
#
### Install Docker
```bash
sudo apt install --no-install-suggests --no-install-recommends apparmor ca-certificates docker.io
sudo modprobe --verbose loop
```

### Create Working Directory
```bash
export DOCKER_BUILD_DIR=/tmp/docker_build
export ROOTFS_NAME=rootfs
mkdir -p $DOCKER_BUILD_DIR/$ROOTFS_NAME
```

### CREATE DOCKER FILE
```bash
cat << EOF > $DOCKER_BUILD_DIR/Dockerfile
FROM scratch
COPY ./$ROOTFS_NAME /
CMD ["/bin/bash"]
EOF
```

### ADD ROOTFS
```bash
sudo cp -rf --preserve=all <source> $DOCKER_BUILD_DIR/$ROOTFS_NAME
```

### BUILD IMAGE 
```bash
sudo docker build -t my_debian:latest $DOCKER_BUILD_DIR
```

### CREATE AND RUN
```bash
docker run --privileged --memory 128m --entrypoint /bin/bash --hostname $(hostname) --env "HOME=/root" --interactive --tty --name <conatiner_name> <image>
```

# RUN CONTAINER
```bash
docker start <container_name>
docker start <container_name> --interactive
```

# ENTER TO CONTAINER
```bash
docker exec --interactive --tty <container_name> /bin/bash
```