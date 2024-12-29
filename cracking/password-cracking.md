# Password Cracking
Generic password cracking reference<br>
For Windows-specific information, check out [Windows Password Cracking](https://github.com/toneillcodes/cybersecurity-notes/blob/main/windows/tools/windows-password-cracking.md)
## john the ripper
Classic tool for password cracking
## hashcat
Password cracking with enhanced functionality and GPU support
Cracking NTDIS hashes
```
$ hashcat -m 1000 hashes.txt /usr/share/wordlist/rockyou.txt
```
```
$ hashcat -m 1000 hashes.txt /usr/share/wordlist/rockyou.txt --show
```
### hashcat modes
- 0: md5
- 100: SHA1
- 1000: NTLM
- 1400: SHA-256
- 13100: KRB5
## wordlists
Kali wordlists
```
sudo gunzip /usr/share/wordlists/rockyou.txt.gz
```
- /usr/share/wordlists/rockyou.txt
- https://github.com/danielmiessler/SecLists/tree/master/Passwords
