#!/bin/bash

# This script:
# Takes a directory path as an argument $1
# Takes the number of days as an argument $2 (default - 7)
# Searches for files older than x days
# Asks the user to delete older files
# Protects against accidental deletion of files

set -euo pipefail

# cheking arguments
if [ $# -lt 1 ]; then
	echo "Using: $0 <path> [days]"
	exit 1
fi

# variables
target_dir="$1"
days_old="${2:-7}"

# cheking if directory exists
if [ ! -d "$target_dir" ]; then
	echo "Error: Directory '$target_dir' does not exists"
	exit 1
fi

# protection against '/' and empty path
if [ "$target_dir" = "/" ] || [ -z "$target_dir" ]; then 
	echo "Operation aborted - wrong path"
	exit 1
fi

echo "Searching for files older than $days_old days in directory: $target_dir"
echo "---------------------------------------------"

# finding files to delete
files_to_delete=$(find "$target_dir" -type f -mtime +"$days_old" -print)

if [ -z "$files_to_delete" ]; then
	echo "No files older than $days_old days."
	exit 0
fi

# displaying found files
echo "$files_to_delete"
echo "---------------------------------------------"
echo "Found $(echo "$files_to_delete" | wc -l) file(s)."

# asking user for confirmation
read -rp "Are you sure you want to delete these files? (y/N):" confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
	echo "Deleting files..."
	find "$target_dir" -type f -mtime +"$days_old" -print -delete
	echo "Files have been deleted."
else
	echo "Operation canceled."
fi
