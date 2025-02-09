# File & Directory Scanning
- In most cases, disabling recursive search is helpful
- Define a user agent or provide a list of user agents
## dirb
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
## gobuster
Required parameters: url and wordlist<br>
Error: required flag(s) "url", "wordlist" not set<br>
<br>
Example:
```
gobuster dir -u http://example.htb -w /usr/share/wordlists/dirb/common.txt
```
Example output:
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
Options:
```
$ gobuster dir --help
Uses directory/file enumeration mode

Usage:
  gobuster dir [flags]

Flags:
  -f, --add-slash                         Append / to each request
      --client-cert-p12 string            a p12 file to use for options TLS client certificates
      --client-cert-p12-password string   the password to the p12 file
      --client-cert-pem string            public key in PEM format for optional TLS client certificates
      --client-cert-pem-key string        private key in PEM format for optional TLS client certificates (this key needs to have no password)
  -c, --cookies string                    Cookies to use for the requests
  -d, --discover-backup                   Also search for backup files by appending multiple backup extensions
      --exclude-length string             exclude the following content lengths (completely ignores the status). You can separate multiple lengths by comma and it also supports ranges like 203-206
  -e, --expanded                          Expanded mode, print full URLs
  -x, --extensions string                 File extension(s) to search for
  -X, --extensions-file string            Read file extension(s) to search from the file
  -r, --follow-redirect                   Follow redirects
  -H, --headers stringArray               Specify HTTP headers, -H 'Header1: val1' -H 'Header2: val2'
  -h, --help                              help for dir
      --hide-length                       Hide the length of the body in the output
  -m, --method string                     Use the following HTTP method (default "GET")
      --no-canonicalize-headers           Do not canonicalize HTTP header names. If set header names are sent as is.
  -n, --no-status                         Don't print status codes
  -k, --no-tls-validation                 Skip TLS certificate verification
  -P, --password string                   Password for Basic Auth
      --proxy string                      Proxy to use for requests [http(s)://host:port] or [socks5://host:port]
      --random-agent                      Use a random User-Agent string
      --retry                             Should retry on request timeout
      --retry-attempts int                Times to retry on request timeout (default 3)
  -s, --status-codes string               Positive status codes (will be overwritten with status-codes-blacklist if set). Can also handle ranges like 200,300-400,404.
  -b, --status-codes-blacklist string     Negative status codes (will override status-codes if set). Can also handle ranges like 200,300-400,404. (default "404")
      --timeout duration                  HTTP Timeout (default 10s)
  -u, --url string                        The target URL
  -a, --useragent string                  Set the User-Agent string (default "gobuster/3.6")
  -U, --username string                   Username for Basic Auth

Global Flags:
      --debug                 Enable debug output
      --delay duration        Time each thread waits between requests (e.g. 1500ms)
      --no-color              Disable color output
      --no-error              Don't display errors
  -z, --no-progress           Don't display progress
  -o, --output string         Output file to write results to (defaults to stdout)
  -p, --pattern string        File containing replacement patterns
  -q, --quiet                 Don't print the banner and other noise
  -t, --threads int           Number of concurrent threads (default 10)
  -v, --verbose               Verbose output (errors)
  -w, --wordlist string       Path to the wordlist. Set to - to use STDIN.
      --wordlist-offset int   Resume from a given position in the wordlist (defaults to 0)
$ 
```

## dirbuster
- Has a GUI
- Can also be run headless
```
root@kali:~# dirbuster -h
DirBuster - 1.0-RC1
Usage: java -jar DirBuster-1.0-RC1 -u <URL http://example.com/> [Options]

	Options:
	 -h : Display this help message
	 -H : Start DirBuster in headless mode (no gui), report will be auto saved on exit
	 -l <Word list to use> : The Word list to use for the list based brute force. Default: /home/kali/kali-www/bin/kali-tools/tool-output/dirbuster/directory-list-2.3-small.txt
	 -g : Only use GET requests. Default Not Set
	 -e <File Extention list> : File Extention list eg asp,aspx. Default: php
	 -t <Number of Threads> : Number of connection threads to use. Default: 10
	 -s <Start point> : Start point of the scan. Default: /
	 -v : Verbose output, Default: Not set
	 -P : Don't Parse html, Default: Not Set
	 -R : Don't be recursive, Default: Not Set
	 -r <location> : File to save report to. Default: /home/kali/kali-www/bin/kali-tools/tool-output/dirbuster/DirBuster-Report-[hostname]-[port].txt

Examples:

Run DirBuster in headless mode
java -jar DirBuster-1.0-RC1.jar -H -u https://www.target.com/

Start GUI with target prepopulated
java -jar DirBuster-1.0-RC1.jar -u https://www.target.com/
```
