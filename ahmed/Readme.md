1. SSH bruteforce
2. FTP bruteforce
3. Something about the website
4. FTP misconfiguration to get the shadow file

The main site has a comment about `<!-- friends are always welcome -->`. I tried accessing the website under different hostnames, `friends.connect.usd` gives a login page. Now I am currently brutforcing the login page with a dictionary of variations on the old password and a few plausible usernames.

After a lot of failed bruteforce I asked chatgpt for plausible passwords. It gave me (among others) 1VeryS3cure2023 which worked on the login page.

The friends page has a form where I can enter content that will be written to a file. The value is used in a shell script, as I can use something like `;ls /` to execute commands. The attached script opens a reverse shell to my machine.

The machine has a cat binary with the SUID bit. We can use this to read the flag at `/root/Desktop/token.txt`. I am not totally satisfied with this solution, as it depends on guessing the path of the token. But hey, it works.
