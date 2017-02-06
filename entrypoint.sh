#!/bin/bash -vx
# Staging server startup script

# Fix config from submodule
echo "TEMP_DIR=/var/tmp" >> /etc/db-backup.conf

