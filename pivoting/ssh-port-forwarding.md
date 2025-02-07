# SSH Port Forwarding
- f: Requests ssh to go to background just before command execution
- N: Do not execute a remote command. This is useful for just forwarding ports (protocol version 2 only)
Dynamic SOCKS forwarding on port 9050 through 10.0.2.7
```
ssh -f -N -D 9050 root@10.0.2.7
```
Dynamic SOCKS forwarding on port 9050 through 10.0.2.7 using the identity in 'pivot_id'
```
ssh -f -N -D 9050 -i pivot_id root@10.0.2.7
```
