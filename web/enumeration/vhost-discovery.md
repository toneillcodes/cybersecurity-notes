# Vhost Discovery
## gobuster
```
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u http://10.129.231.139 -t 50 --domain example.htb --append-domain
```
```
$ gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u http://10.129.231.139 -t 50 --domain example.htb --append-domain
===============================================================
Gobuster v3.6
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:             http://10.129.231.139
[+] Method:          GET
[+] Threads:         50
[+] Wordlist:        /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
[+] User Agent:      gobuster/3.6
[+] Timeout:         10s
[+] Append Domain:   true
===============================================================
Starting gobuster in VHOST enumeration mode
===============================================================
Found: cacti.example.htb Status: 302 [Size: 0] [--> /cacti]
Progress: 4989 / 4990 (99.98%)
===============================================================
Finished
===============================================================

$
```
## ffuf
ffuf is another great tool
```
ffuf -H "Host: FUZZ.example.htb" -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u http://10.129.231.221 -mc 200
```
```
$ ffuf -H "Host: FUZZ.example.htb" -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u http://10.129.231.221 -mc 200

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.1.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://10.129.231.221
 :: Wordlist         : FUZZ: /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
 :: Header           : Host: FUZZ.example.htb
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200
________________________________________________

dev                     [Status: 200, Size: 13982, Words: 1107, Lines: 276, Duration: 14ms]
:: Progress: [4989/4989] :: Job [1/1] :: 4651 req/sec :: Duration: [0:00:01] :: Errors: 0 ::
$
```
