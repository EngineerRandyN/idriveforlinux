# IDriveForLinux
IDriveForLinux Docker container on arm64 for ubuntu.

## Environment variables

* USERNAME - idrive username
* PASSWORD - idrive password
* BACKUP_NAME - Name of idrive backup (such as your device name)

## Volumes

* /opt/IDriveForLinux - Persists user login when recreating the container. Optional.

## How to use

After successful deployment, you can attach to the console and modify from there. You will need to attach volumes in order for the container to do backups. For example in docker compose, one can map their /home directory to the container's /backup directory. Then setup idrive to backup the /backup directory.
