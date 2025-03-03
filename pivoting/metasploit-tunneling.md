# Metasploit Tunneling
## Routing Traffic
### Meterpreter
- Create a route
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
