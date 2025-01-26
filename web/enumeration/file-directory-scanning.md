# File & Directory Scanning
- In most cases, disabling recursive search is helpful
- Define a user agent or provide a list of user agents
## dirb
Options:
```
-----------------
DIRB v2.22    
By The Dark Raver
-----------------

dirb <url_base> [<wordlist_file(s)>] [options]

========================= NOTES =========================
 <url_base> : Base URL to scan. (Use -resume for session resuming)
 <wordlist_file(s)> : List of wordfiles. (wordfile1,wordfile2,wordfile3...)

======================== HOTKEYS ========================
 'n' -> Go to next directory.
 'q' -> Stop scan. (Saving state for resume)
 'r' -> Remaining scan stats.

======================== OPTIONS ========================
 -a <agent_string> : Specify your custom USER_AGENT.
 -b : Use path as is.
 -c <cookie_string> : Set a cookie for the HTTP request.
 -E <certificate> : path to the client certificate.
 -f : Fine tunning of NOT_FOUND (404) detection.
 -H <header_string> : Add a custom header to the HTTP request.
 -i : Use case-insensitive search.
 -l : Print "Location" header when found.
 -N <nf_code>: Ignore responses with this HTTP code.
 -o <output_file> : Save output to disk.
 -p <proxy[:port]> : Use this proxy. (Default port is 1080)
 -P <proxy_username:proxy_password> : Proxy Authentication.
 -r : Don't search recursively.
 -R : Interactive recursion. (Asks for each directory)
 -S : Silent Mode. Don't show tested words. (For dumb terminals)
 -t : Don't force an ending '/' on URLs.
 -u <username:password> : HTTP Authentication.
 -v : Show also NOT_FOUND pages.
 -w : Don't stop on WARNING messages.
 -X <extensions> / -x <exts_file> : Append each word with this extensions.
 -z <millisecs> : Add a milliseconds delay to not cause excessive Flood.

======================== EXAMPLES =======================
 dirb http://url/directory/ (Simple Test)
 dirb http://url/ -X .html (Test files with '.html' extension)
 dirb http://url/ /usr/share/dirb/wordlists/vulns/apache.txt (Test with apache.txt wordlist)
 dirb https://secure_url/ (Simple Test with SSL)
```

Example command:
```
dirb https://example.htb
```
Example output:
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

```
gobuster dir -u http://example.htb -w /usr/share/wordlists/dirb/common.txt
```

```
$ gobuster dir -u http://example.htb -w /usr/share/wordlists/dirb/common.txt
===============================================================
Gobuster v3.5
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://example.htb
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /usr/share/wordlists/dirb/common.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.5
[+] Timeout:                 10s
===============================================================
2023/03/31 13:34:20 Starting gobuster in directory enumeration mode
===============================================================
/download             (Status: 302) [Size: 249] [--> /account/login?next=%2Fdownload]
/static               (Status: 301) [Size: 178] [--> http://example.htb/static/]
/vault                (Status: 302) [Size: 243] [--> /account/login?next=%2Fvault]
Progress: 4516 / 4615 (97.85%)
===============================================================
2023/03/31 13:34:30 Finished
===============================================================

$
```
