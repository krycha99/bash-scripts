#!/bin/bash

# This script:
# Reads a list of addresses from a file hosts.txt or the specified file $1
# Checks if they respond to ping
# Prints the result to the screen and to the log file.

set -euo pipefail

#files variables
INPUT="${1:-hosts.txt}"
OUTPUT="${2:-ping_results.txt}"

#creating result file
: > "$OUTPUT"

#checking if output file exists
while IFS= read -r host; do
	[[ -z "$host" || "$host" =~ ^# ]] && continue

	#Ping host with 1 packet and printing output depending on the result 
	if ping -c 1 -W 1 "$host" > /dev/null 2>&1; then
		echo "$host responds"
		echo "$host - OK" >> "$OUTPUT"
	else
		echo "$host is not responding"
		echo "$host - NO RESPONSE" >> "$OUTPUT"
	fi
done < "$INPUT"

#summary
echo "Result saved to: $OUTPUT"
