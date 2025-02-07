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
