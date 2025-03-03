# Proxychains Tunneling
Proxychains allows you to run a binary and tunnel its TCP connections through a SOCKS proxy<br>
This can be useful when you have a dynamic SOCKS proxy that you want to easily leverage with multiple tools.<br>
It can also be useful when you are working with a binary that does not have native support for a proxy.<br>
NOTE: Proxychains does not support UDP
Example using proxychains with nmap scan ports through a SOCKS proxy
```
$ proxychains -q nmap -sT 10.185.10.27 -p1-65535 -Pn
Starting Nmap 7.94SVN ( https://nmap.org ) at 2023-11-15 10:57 EST
Nmap scan report for 10.185.10.27
Host is up (0.049s latency).
Not shown: 65523 closed tcp ports (conn-refused)
PORT      STATE SERVICE
135/tcp   open  msrpc
139/tcp   open  netbios-ssn
445/tcp   open  microsoft-ds
554/tcp   open  rtsp
2869/tcp  open  icslap
10243/tcp open  unknown
49152/tcp open  unknown
49153/tcp open  unknown
49154/tcp open  unknown
49155/tcp open  unknown
49156/tcp open  unknown
49158/tcp open  unknown

Nmap done: 1 IP address (1 host up) scanned in 3277.29 seconds

$
```

Example
```
$ nc -w 1 -vv 172.16.1.23 80
172.16.1.23: inverse host lookup failed: Unknown host
(UNKNOWN) [172.16.1.23] 80 (http) : Connection timed out
 sent 0, rcvd 0
$ proxychains nc -w 1 -vv 172.16.1.23 80
[proxychains] config file found: /etc/proxychains.conf
[proxychains] preloading /usr/lib/x86_64-linux-gnu/libproxychains.so.4
[proxychains] DLL init: proxychains-ng 4.16
[proxychains] Strict chain  ...  127.0.0.1:9050  ...  172.16.1.23:80  ...  OK
172.16.1.23 [172.16.1.23] 80 (http) open : Operation now in progress
GET /
HTTP/1.1 400 Bad Request
Date: Mon, 03 Mar 2025 17:39:27 GMT
Server: Apache/2.4.29 (Ubuntu)
Content-Length: 301
Connection: close
Content-Type: text/html; charset=iso-8859-1

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>400 Bad Request</title>
</head><body>
<h1>Bad Request</h1>
<p>Your browser sent a request that this server could not understand.<br />
</p>
<hr>
<address>Apache/2.4.29 (Ubuntu) Server at 127.0.1.1 Port 80</address>
</body></html>
 sent 6, rcvd 483
$
```

## SOCKS 5
```
$ sudo vi /etc/proxychains.conf 
...
[ProxyList]
# add proxy here ...
# meanwile
# defaults set to "tor"
socks5 	127.0.0.1 9050
$
```
