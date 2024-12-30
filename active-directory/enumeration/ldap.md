# LDAP Enumeration
LDAP stores sensitive, operational data
## Tools
### ldapsearch
```
ldapsearch -x -H ldap://[Target_IP] -b "DC=contoso,DC=com" "(objectClass=user)"
```
### enum4linux
```
enum4linux -u testuser -p Password123 10.129.121.92
```
