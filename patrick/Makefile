user:
	bash ./getInfo.sh

files:
	mkdir -p files/home
	scp -r user@10.2.17.16:/home/user files/home/user/

unscramble: unscramble.c
	gcc unscramble.c -o unscramble -g -fno-stack-protector -no-pie

w1: files/home/user/write_to_blockchain_v1.c
	gcc files/home/user/write_to_blockchain_v1.c -o ./w1 -g -Wno-format-security -fno-stack-protector -no-pie

w2: files/home/user/write_to_blockchain_v2.c
	gcc files/home/user/write_to_blockchain_v2.c -o ./w2 -g -Wno-format-security -fstack-protector