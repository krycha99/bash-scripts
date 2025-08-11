#!/bin/bash

# A script that on default searches for files larger than 1MB
# and saves their full paths to a text file.

# User can customize the scripts operation using arguments:
#$1 - directory, if not specified script takes current one
#$2 - bytes size, if not specified script looking for files larger than 1MB
#$3 - output file name, if not specified default one is "found_files.txt"

set -euo pipefail

#variables
dir="${1:-.}"
min_size_bytes="${2:-1048576}"
output="${3:-found_files.txt}"

#creating output file
: > "$output"

#looking for files larger than min_size_bytes
find "$dir" -type f -size +"${min_size_bytes}"c -print0 |
while IFS= read -r -d '' file; do
	size=$(stat -c %s "$file")
	printf '%s\t%s bytes\n' "$file" "$size" >> "$output"
done

#print summary
echo "Written list of files larger than ${min_size_bytes} bytes to: $output"
