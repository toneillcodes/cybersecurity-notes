# regsvc ACL privesc

Using PowerShell:
```
Get-Acl -Path hklm:\System\CurrentControlSet\services\regsrv | fl
```
Check the output for 'NT AUTHORITY\INTERACTIVE' has 'Allow FullControl'
