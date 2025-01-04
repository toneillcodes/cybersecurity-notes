# NetExec

## File Transfers
Put file
```
nxc smb 172.16.251.152 -u user -p pass --put-file /tmp/whoami.txt \\Windows\\Temp\\whoami.txt
```

Get file
```
nxc smb 172.16.251.152 -u user -p pass --get-file \\Windows\\Temp\\whoami.txt /tmp/whoami.txt
```
