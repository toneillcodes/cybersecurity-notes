# Pivoting
Pivoting can expose services/hosts that may not normally be accessible.

## SSH Port Forwarding
```
ssh -f -N -D 9050 -i pivot root@10.0.2.7
```

## msfconsole
Routing functionality available through meterpreter sessions

## chisel
Server and client in a single binary

## sshuttle
Transparent proxy
```
sshuttle -r root@10.0.2.7 10.10.10.0/24
````
```
sshuttle -r root@10.0.2.7 10.10.10.0/24 --ssh-cmd "ssh -i pivot"
````

## proxychains
Direct binary traffic through SOCKS proxy
