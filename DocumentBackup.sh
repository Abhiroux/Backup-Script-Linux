#!/bin/bash

# Variables
SOURCE="/home/abhiroux/Documents"                              			# Directory you want to backup (relative path)
BACKUP_DIR="/home/abhiroux/BackupProject/Backups"                       	# Local backup directory
DATE=$(date +"%Y-%m-%d_%H-%M-%S")                				# Timestamp for the backup
LOG_FILE="/home/abhiroux/BackupProject/backup_log.txt"                       	# Log file in the current directory

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create a temporary local backup (the tar.gz file will be created in the Backups directory)
LOCAL_BACKUP="$BACKUP_DIR/backup_$DATE.tar.gz"
tar -czf $LOCAL_BACKUP $SOURCE

# Log the backup status
if [ $? -eq 0 ]; then
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup completed successfully!" >> $LOG_FILE
else
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Backup failed!" >> $LOG_FILE
fi

# Optionally, print the path of the backup
echo "Backup created at: $LOCAL_BACKUP"

