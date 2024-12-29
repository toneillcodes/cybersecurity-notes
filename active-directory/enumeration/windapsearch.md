# windapsearch
## Example
windapsearch
```
$ windapsearch -d example.htb --dc 10.129.240.70 -u Olivia -p Password123 -m users 
dn: CN=Michael Williams,CN=Users,DC=example,DC=htb
cn: Michael Williams
sAMAccountName: michael
userPrincipalName: michael@example.htb

dn: CN=Benjamin Brown,CN=Users,DC=example,DC=htb
cn: Benjamin Brown
sAMAccountName: benjamin
userPrincipalName: benjamin@example.htb

dn: CN=Administrator,CN=Users,DC=example,DC=htb
cn: Administrator
sAMAccountName: Administrator

dn: CN=Guest,CN=Users,DC=example,DC=htb
cn: Guest
sAMAccountName: Guest

dn: CN=krbtgt,CN=Users,DC=example,DC=htb
cn: krbtgt
sAMAccountName: krbtgt

dn: CN=Olivia Johnson,CN=Users,DC=example,DC=htb
cn: Olivia Johnson
sAMAccountName: olivia
userPrincipalName: olivia@example.htb

dn: CN=Emily Rodriguez,CN=Users,DC=example,DC=htb
cn: Emily Rodriguez
sAMAccountName: emily
userPrincipalName: emily@example.htb

dn: CN=Ethan Hunt,CN=Users,DC=example,DC=htb
cn: Ethan Hunt
sAMAccountName: ethan
userPrincipalName: ethan@example.htb

dn: CN=Emma Johnson,CN=Users,DC=example,DC=htb
cn: Emma Johnson
sAMAccountName: emma
userPrincipalName: emma@example.htb

dn: CN=Alexander Smith,CN=Users,DC=example,DC=htb
cn: Alexander Smith
sAMAccountName: alexander
userPrincipalName: alexander@example.htb
$
```
