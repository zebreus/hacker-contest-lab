#!/usr/bin/env bash
# shellcheck disable=SC2024

if [ -z "$ADDRESS" ]; then
    echo "ADDRESS is not set. Exiting."
    exit 1
fi

# Agressive scan
sudo nmap -A ---exclude-ports 65535 -p0-65535 "$ADDRESS" >nmap-aggressive.txt 2>&1
