#!/bin/bash

set -euo pipefail

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin/:/usr/bin:/sbin:/bin

# log file
LOG_FILE="$HOME/system_monitor.log"

# date
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}' )

# RAM usage
RAM_USAGE=$(free -m | awk '/Mem:/ { printf "%s/%s MB (%.2f%%)", $3, $2, $3/$2 * 100 }')

# creating log
echo "$TIMESTAMP | CPU: $CPU_USAGE | RAM: $RAM_USAGE" >> "$LOG_FILE"
