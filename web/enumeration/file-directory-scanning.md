# File & Directory Scanning
## dirb
Notes
```
$ dirb https://example.htb

-----------------
DIRB v2.22
By The Dark Raver
-----------------

START_TIME: Sun Jul 16 14:50:54 2023
URL_BASE: https://example.htb/
WORDLIST_FILES: /usr/share/dirb/wordlists/common.txt

-----------------

GENERATED WORDS: 4612

---- Scanning URL: https://example.htb/ ----
+ https://example.htb/about (CODE:200|SIZE:5584)
+ https://example.htb/admin (CODE:302|SIZE:227)
+ https://example.htb/contact (CODE:200|SIZE:3543)
+ https://example.htb/guide (CODE:200|SIZE:9043)
+ https://example.htb/login (CODE:200|SIZE:4392)
+ https://example.htb/logout (CODE:302|SIZE:229)
+ https://example.htb/pgp (CODE:200|SIZE:3187)
+ https://example.htb/process (CODE:405|SIZE:153)
+ https://example.htb/view (CODE:302|SIZE:225)

-----------------
END_TIME: Sun Jul 16 14:52:29 2023
DOWNLOADED: 4612 - FOUND: 9

$
```
## gobuster
