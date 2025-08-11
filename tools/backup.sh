#!/bin/bash

# Script gets the name of directory to be backed up, creates a .tar.gz archive
# and appends date to archive name
# script takes one argument which is the path to the directory
# that we want backup

#variables
CATALOG=$1
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT="backup_${DATA}.tar.gz"

#checking path
if [ -z "$CATALOG" ]; then
	echo "Path used: $0 <path>"
	exit 1
fi

if [ ! -d "$CATALOG" ]; then
	echo "Error: directory '$CATALOG' doesnt exist."
	exit 1
fi

#creating an archive
tar -czf "$OUTPUT" "$CATALOG"

#Summary
if [ $? -eq 0 ]; then
	echo "Backup has been created: $OUTPUT"
else
	echo "An error occurred while creating the backup!"
	exit 1
fi
