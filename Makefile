targets = alice heidi jack skylar ahmed ava lincoln sophie mina

.PHONY: all portscan nmap_aggressive

all: portscan .WAIT nmap_aggressive
portscan: $(addsuffix /portscan.txt, $(targets))
nmap_aggressive: $(addsuffix /nmap_aggressive.txt, $(targets))

.ONESHELL:
%/portscan.txt: scripts/nmap_portscan.sh %/config.sh
	cd $*
	pwd
	source ./config.sh
	bash ../scripts/nmap_portscan.sh

.ONESHELL:
%/nmap_aggressive.txt: scripts/nmap_aggressive.sh %/config.sh
	cd $*
	pwd
	source ./config.sh
	bash ../scripts/nmap_aggressive.sh