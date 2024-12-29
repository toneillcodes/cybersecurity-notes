# Windows Password Cracking
Hashes can be obtained through a variety of methods<br>
They can also be cracked through a variety of methods<br>
Hashes that cannot be cracked may still prove useful...
## john the ripper
Classic tool for password cracking
## hashcat
Password cracking with enhanced functionality and GPU support
```
$ hashcat -m 1000 hashes.txt /usr/share/wordlist/rockyou.txt
```
```
$ hashcat -m 1000 hashes.txt /usr/share/wordlist/rockyou.txt --show
```
