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
### NetExec
#### LDAP Module
Enumerate users
```
nxc ldap example.htb -u melanie -p Password123 --users
```
Example output:
```
$ nxc ldap example.htb -u melanie -p Password123 --users
SMB         10.129.254.250  445    RESOLUTE         [*] Windows Server 2016 Standard 14393 x64 (name:EXAMPLE) (domain:example.local) (signing:True) (SMBv1:True)
LDAP        10.129.254.250  389    RESOLUTE         [+] example.local\melanie:Password123 
LDAP        10.129.254.250  389    RESOLUTE         [*] Enumerated 27 domain users: example.local
LDAP        10.129.254.250  389    RESOLUTE         -Username-                    -Last PW Set-       -BadPW- -Description-                        
LDAP        10.129.254.250  389    RESOLUTE         Administrator                 2024-12-22 12:47:02 0       Built-in account for administering the computer/domain
LDAP        10.129.254.250  389    RESOLUTE         Guest                         <never>             0       Built-in account for guest access to the computer/domain
LDAP        10.129.254.250  389    RESOLUTE         DefaultAccount                <never>             0       A user account managed by the system.
LDAP        10.129.254.250  389    RESOLUTE         krbtgt                        2019-09-25 13:29:12 0       Key Distribution Center Service Account
LDAP        10.129.254.250  389    RESOLUTE         ryan                          2024-12-22 12:46:02 0                                            
LDAP        10.129.254.250  389    RESOLUTE         marko                         2019-09-27 13:17:14 0       Account created. Password set to Welcome123!
LDAP        10.129.254.250  389    RESOLUTE         sunita                        2019-12-03 21:26:29 0                                            
LDAP        10.129.254.250  389    RESOLUTE         abigail                       2019-12-03 21:27:30 0                                            
LDAP        10.129.254.250  389    RESOLUTE         marcus                        2019-12-03 21:27:59 0                                            
LDAP        10.129.254.250  389    RESOLUTE         sally                         2019-12-03 21:28:29 0                                            
LDAP        10.129.254.250  389    RESOLUTE         fred                          2019-12-03 21:29:01 0                                            
LDAP        10.129.254.250  389    RESOLUTE         angela                        2019-12-03 21:29:43 0                                            
LDAP        10.129.254.250  389    RESOLUTE         felicia                       2019-12-03 21:30:53 0                                            
LDAP        10.129.254.250  389    RESOLUTE         gustavo                       2019-12-03 21:31:42 0                                            
LDAP        10.129.254.250  389    RESOLUTE         ulf                           2019-12-03 21:32:19 0                                            
LDAP        10.129.254.250  389    RESOLUTE         stevie                        2019-12-03 21:33:13 0                                            
LDAP        10.129.254.250  389    RESOLUTE         claire                        2019-12-03 21:33:44 0                                            
LDAP        10.129.254.250  389    RESOLUTE         paulo                         2019-12-03 21:34:46 0                                            
LDAP        10.129.254.250  389    RESOLUTE         steve                         2019-12-03 21:35:25 0                                            
LDAP        10.129.254.250  389    RESOLUTE         annette                       2019-12-03 21:36:55 0                                            
LDAP        10.129.254.250  389    RESOLUTE         annika                        2019-12-03 21:37:23 0                                            
LDAP        10.129.254.250  389    RESOLUTE         per                           2019-12-03 21:38:12 0                                            
LDAP        10.129.254.250  389    RESOLUTE         claude                        2019-12-03 21:39:56 0                                            
LDAP        10.129.254.250  389    RESOLUTE         melanie                       2024-12-22 12:47:02 0                                            
LDAP        10.129.254.250  389    RESOLUTE         zach                          2019-12-04 10:39:27 0                                            
LDAP        10.129.254.250  389    RESOLUTE         simon                         2019-12-04 10:39:58 0                                            
LDAP        10.129.254.250  389    RESOLUTE         naoki                         2019-12-04 10:40:44 0                                            
$ 
```
