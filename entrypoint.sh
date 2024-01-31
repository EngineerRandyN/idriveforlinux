#!/usr/bin/env bash

IDRIVE_BIN_DIR="/opt/IDriveForLinux/bin"

if [[ ! -d "$IDRIVE_BIN_DIR" ]]; then
    expect script.exp ${USERNAME} ${PASSWORD} ${BACKUP_NAME}
fi

tail -f /dev/null