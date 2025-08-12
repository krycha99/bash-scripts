#!/bin/bash

# This script:
# Opens multiple sites from sites.txt file with specified browser

# site file assignment, you can assign ur own file here
sites_file="sites.txt"

# checking if file  exists
if [[ ! -f "$sites_file" ]]; then
	echo "The selected file does not exist"
	exit 1
fi

# browser assignment, you can set your own here
browser="firefox"

# opening all adresses from site file
echo "Openings sites from '$sites_file'... "
while IFS= read -r url; do
	[[ -z "$url" ]] && continue
	"$browser" "$url" &
done < "$sites_file"
