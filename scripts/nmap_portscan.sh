#!/usr/bin/env bash
# shellcheck disable=SC2024
# shellcheck disable=SC2129

if [ -z "$ADDRESS" ]; then
    echo "ADDRESS is not set. Exiting."
    exit 1
fi

echo "#### TCP SCAN ####" >portscan.txt
sudo nmap --exclude-ports 65535 -p0-65535 -sS "$ADDRESS" >>portscan.txt 2>&1

# echo "#### UDP SCAN ####" >>portscan.txt
# sudo nmap --exclude-ports 65535 -sU "$ADDRESS" >>portscan.txt 2>&1