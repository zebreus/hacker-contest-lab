1. Revshell via injecting python code in a badly sanitized form
2. Exfiltrate sqlite database
3. Get lukas password (`2489q8salgharafucee`)
4. Get user flag
5. Exfiltrate and decompile SUID binary `/usr/bin/system-update`
6. Place your [own apt implementation](./apt) somewhere and add it to the path.
7. Run `system-update` which will run your apt implementation as root.
8. Get root flag
