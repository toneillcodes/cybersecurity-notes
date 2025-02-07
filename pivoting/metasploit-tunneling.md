# Metasploit Tunneling
Create a route
```
run autoroute -s 10.129.207.128/20
```
Forward a port
```
portfwd add -l 5432 -p 5432 -r 10.129.207.128
```
