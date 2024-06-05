dirb.log:
	dirb http://10.2.17.7 /nix/store/1hdi008pdiprfpc802dj9ni5h2xq39g6-dirb-2.22/share/dirb/wordlists/big.txt -w -o dirb.log

nikto.log:
	nikto -h 10.2.17.7 2>&1 | tee nikto.log