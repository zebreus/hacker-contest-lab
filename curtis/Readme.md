## Port 80: Unfinished website

Seems irrelevant for now

## Port 5000: Weird flask app

API to generate report from the website. Also provides read and write vectors.

## Port 3000: Weird dashboard

As far as I can see, this is only used as a pointer to port 5000

1. /report endpoint lets us read and check for arbitrary files. However no listing
2. We used wfuzz to find main.py
3. Read /proc/self/cmdline to find out where out process is living: `/usr/bin/flask` 
4. Figure out where main.py lives, so we can override it. `../../../etc/passwd` means that it is exactly three layers deep. Hacky solution: write to `/proc/self/cwd/main.py` which works
5. We write a revshell payload to main.py to add a new `/revshell` route
6. The server needs to reload main.py. We can force a reload by crashing the server with an OOM error. The diamond_hands endpoint reads the entire file into memory, we just need to send enough data.
7. Run `deno run --allow-all ./exploit.ts` to perform the steps to this point.
8. After that you can run `bash revshell.sh` to start a reverse shell.