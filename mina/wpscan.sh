#!/usr/bin/env bash

wprecon -u http://10.2.17.14/wordpress --aggressive-mode 2>&1 | tee wprecon.log
wpscan --url http://10.2.17.14/wordpress --api-token o5yNGEmaXgsKterDt06sm9boI5KsypOUodsTMdP10AA -e ap at tt cb deb u m --plugins-detection aggressive --plugins-version-detection aggressive  --detection-mode aggressive 2>&1 | tee wpscan.log

