#!/bin/bash

# This script:
# is a simple automated htop installer on ubuntu

set -euo pipefail

# ASCII banner
cat << "EOF"
  /\  /\ |_ ___  _ __   (_)_ __  ___| |_ __ _| | | ___ _ __ 
 / /_/ / __/ _ \| '_ \  | | '_ \/ __| __/ _` | | |/ _ \ '__|
/ __  /| || (_) | |_) | | | | | \__ \ || (_| | | |  __/ |   
\/ /_/  \__\___/| .__/  |_|_| |_|___/\__\__,_|_|_|\___|_|   
                |_|                                        
EOF
echo
echo "--------------------------------------------------------------------"


# cheking if apt is working
if ! command -v apt &>/dev/null; then
	echo "This script works only on systems with apt."
	exit 1
fi

# apt update
echo "Updating package list..."
sudo apt update -y

# htop installation
echo "Installing htop..."
sudo apt install -y htop

# version check
echo "Instalation completed successfully."
echo "htop version: "
htop --version



