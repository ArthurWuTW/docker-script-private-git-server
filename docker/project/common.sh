REPO_DIR=$(realpath $(realpath $(dirname $PWD)/dependencies))
HOSTNAME=$(cat /etc/hostname)
DOCKER_DIR=$REPO_DIR
IMAGE_NAME=${IMAGE_NAME:-project_backup_server}
CONTAINER_USER=user
CONTAINER_HOME=/home/$CONTAINER_USER
CONTAINER_REPO_DIR=/repository
CONTAINER_PERSISTENT_DIR=/persistent
CONTAINER_PERSISTENT_VOLUME=project_backup_server-persistent-data
CONTAINER_NAME=project_backup_server

# NVIDIA_DRIVER_VERSION=$(nvidia-smi -q | grep "Driver Version" | tr -s ' ' | cut -d ' ' -f4)
# NVIDIA_DRIVER_VERSION_MAJOR=$(echo $NVIDIA_DRIVER_VERSION | cut -d '.' -f1)
# NVIDIA_DRIVER_VERSION_MINOR=$(echo $NVIDIA_DRIVER_VERSION | cut -d '.' -f2)
# NVIDIA_DRIVER_DIR=$(\
#     find /usr/lib -name libGLX_nvidia.so* | \
#     grep $NVIDIA_DRIVER_VERSION_MAJOR | \
#     tail -1 | \
#     grep -oh "/.*/" \
# )
