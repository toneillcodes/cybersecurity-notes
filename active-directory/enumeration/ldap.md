# LDAP Enumeration
LDAP stores sensitive, operational data
## Tools
### ldapsearch
```
ldapsearch -H ldap://certified.htb -x -s base -b '' "(objectClass=*)" "*"
```
Example output:
```
$ ldapsearch -H ldap://certified.htb -x -s base -b '' "(objectClass=*)" "*"
# extended LDIF
#
# LDAPv3
# base <> with scope baseObject
# filter: (objectClass=*)
# requesting: *
#

#
dn:
domainFunctionality: 7
forestFunctionality: 7
domainControllerFunctionality: 7
rootDomainNamingContext: DC=certified,DC=htb
ldapServiceName: certified.htb:dc01$@CERTIFIED.HTB
isGlobalCatalogReady: TRUE
supportedSASLMechanisms: GSSAPI
supportedSASLMechanisms: GSS-SPNEGO
supportedSASLMechanisms: EXTERNAL
supportedSASLMechanisms: DIGEST-MD5
supportedLDAPVersion: 3
supportedLDAPVersion: 2
supportedLDAPPolicies: MaxPoolThreads
supportedLDAPPolicies: MaxPercentDirSyncRequests
supportedLDAPPolicies: MaxDatagramRecv
supportedLDAPPolicies: MaxReceiveBuffer
supportedLDAPPolicies: InitRecvTimeout
supportedLDAPPolicies: MaxConnections
supportedLDAPPolicies: MaxConnIdleTime
supportedLDAPPolicies: MaxPageSize
supportedLDAPPolicies: MaxBatchReturnMessages
supportedLDAPPolicies: MaxQueryDuration
supportedLDAPPolicies: MaxDirSyncDuration
supportedLDAPPolicies: MaxTempTableSize
supportedLDAPPolicies: MaxResultSetSize
supportedLDAPPolicies: MinResultSets
supportedLDAPPolicies: MaxResultSetsPerConn
supportedLDAPPolicies: MaxNotificationPerConn
supportedLDAPPolicies: MaxValRange
supportedLDAPPolicies: MaxValRangeTransitive
supportedLDAPPolicies: ThreadMemoryLimit
supportedLDAPPolicies: SystemMemoryLimitPercent
supportedControl: 1.2.840.113556.1.4.319
supportedControl: 1.2.840.113556.1.4.801
supportedControl: 1.2.840.113556.1.4.473
supportedControl: 1.2.840.113556.1.4.528
supportedControl: 1.2.840.113556.1.4.417
supportedControl: 1.2.840.113556.1.4.619
supportedControl: 1.2.840.113556.1.4.841
supportedControl: 1.2.840.113556.1.4.529
supportedControl: 1.2.840.113556.1.4.805
supportedControl: 1.2.840.113556.1.4.521
supportedControl: 1.2.840.113556.1.4.970
supportedControl: 1.2.840.113556.1.4.1338
supportedControl: 1.2.840.113556.1.4.474
supportedControl: 1.2.840.113556.1.4.1339
supportedControl: 1.2.840.113556.1.4.1340
supportedControl: 1.2.840.113556.1.4.1413
supportedControl: 2.16.840.1.113730.3.4.9
supportedControl: 2.16.840.1.113730.3.4.10
supportedControl: 1.2.840.113556.1.4.1504
supportedControl: 1.2.840.113556.1.4.1852
supportedControl: 1.2.840.113556.1.4.802
supportedControl: 1.2.840.113556.1.4.1907
supportedControl: 1.2.840.113556.1.4.1948
supportedControl: 1.2.840.113556.1.4.1974
supportedControl: 1.2.840.113556.1.4.1341
supportedControl: 1.2.840.113556.1.4.2026
supportedControl: 1.2.840.113556.1.4.2064
supportedControl: 1.2.840.113556.1.4.2065
supportedControl: 1.2.840.113556.1.4.2066
supportedControl: 1.2.840.113556.1.4.2090
supportedControl: 1.2.840.113556.1.4.2205
supportedControl: 1.2.840.113556.1.4.2204
supportedControl: 1.2.840.113556.1.4.2206
supportedControl: 1.2.840.113556.1.4.2211
supportedControl: 1.2.840.113556.1.4.2239
supportedControl: 1.2.840.113556.1.4.2255
supportedControl: 1.2.840.113556.1.4.2256
supportedControl: 1.2.840.113556.1.4.2309
supportedControl: 1.2.840.113556.1.4.2330
supportedControl: 1.2.840.113556.1.4.2354
supportedCapabilities: 1.2.840.113556.1.4.800
supportedCapabilities: 1.2.840.113556.1.4.1670
supportedCapabilities: 1.2.840.113556.1.4.1791
supportedCapabilities: 1.2.840.113556.1.4.1935
supportedCapabilities: 1.2.840.113556.1.4.2080
supportedCapabilities: 1.2.840.113556.1.4.2237
subschemaSubentry: CN=Aggregate,CN=Schema,CN=Configuration,DC=certified,DC=htb
serverName: CN=DC01,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configur
 ation,DC=certified,DC=htb
schemaNamingContext: CN=Schema,CN=Configuration,DC=certified,DC=htb
namingContexts: DC=certified,DC=htb
namingContexts: CN=Configuration,DC=certified,DC=htb
namingContexts: CN=Schema,CN=Configuration,DC=certified,DC=htb
namingContexts: DC=DomainDnsZones,DC=certified,DC=htb
namingContexts: DC=ForestDnsZones,DC=certified,DC=htb
isSynchronized: TRUE
highestCommittedUSN: 90331
dsServiceName: CN=NTDS Settings,CN=DC01,CN=Servers,CN=Default-First-Site-Name,
 CN=Sites,CN=Configuration,DC=certified,DC=htb
dnsHostName: DC01.certified.htb
defaultNamingContext: DC=certified,DC=htb
currentTime: 20241103062934.0Z
configurationNamingContext: CN=Configuration,DC=certified,DC=htb

# search result
search: 2
result: 0 Success

# numResponses: 2
# numEntries: 1

$
```
Lookup users, ignore inactive accounts (useraccountcontrol=2)
```
ldapsearch -x -H 'ldap://10.129.237.154' -D 'SVC_TGS' -w 'Password123' -b "dc=active,dc=htb" -s sub "(&(objectCategory=person)(objectClass=user)(!(useraccountcontrol:1.2.840.113556.1.4.803:=2)))" samaccountname | grep sAMAccountNameccountName
```
```
$ ldapsearch -x -H 'ldap://10.129.237.154' -D 'SVC_TGS' -w 'Password123' -b "dc=active,dc=htb" -s sub "(&(objectCategory=person)(objectClass=user)(!(useraccountcontrol:1.2.840.113556.1.4.803:=2)))" samaccountname | grep sAMAccountNameccountName
sAMAccountName: Administrator
sAMAccountName: SVC_TGS
$ 
```
### enum4linux
```
enum4linux -u testuser -p Password123 10.129.121.92
```
### NetExec
#### LDAP Module
Enumerate users:
```
nxc ldap example.htb -u melanie -p Password123 --users
```
Example output:
```
$ nxc ldap example.htb -u melanie -p Password123 --users
SMB         10.129.254.250  445    EXAMPLE         [*] Windows Server 2016 Standard 14393 x64 (name:EXAMPLE) (domain:example.local) (signing:True) (SMBv1:True)
LDAP        10.129.254.250  389    EXAMPLE         [+] example.local\melanie:Password123 
LDAP        10.129.254.250  389    EXAMPLE         [*] Enumerated 27 domain users: example.local
LDAP        10.129.254.250  389    EXAMPLE         -Username-                    -Last PW Set-       -BadPW- -Description-                        
LDAP        10.129.254.250  389    EXAMPLE         Administrator                 2024-12-22 12:47:02 0       Built-in account for administering the computer/domain
LDAP        10.129.254.250  389    EXAMPLE         Guest                         <never>             0       Built-in account for guest access to the computer/domain
LDAP        10.129.254.250  389    EXAMPLE         DefaultAccount                <never>             0       A user account managed by the system.
LDAP        10.129.254.250  389    EXAMPLE         krbtgt                        2019-09-25 13:29:12 0       Key Distribution Center Service Account
LDAP        10.129.254.250  389    EXAMPLE         ryan                          2024-12-22 12:46:02 0                                            
LDAP        10.129.254.250  389    EXAMPLE         marko                         2019-09-27 13:17:14 0       Account created. Password set to Welcome123!
LDAP        10.129.254.250  389    EXAMPLE         sunita                        2019-12-03 21:26:29 0                                            
LDAP        10.129.254.250  389    EXAMPLE         abigail                       2019-12-03 21:27:30 0                                            
LDAP        10.129.254.250  389    EXAMPLE         marcus                        2019-12-03 21:27:59 0                                            
LDAP        10.129.254.250  389    EXAMPLE         sally                         2019-12-03 21:28:29 0                                            
LDAP        10.129.254.250  389    EXAMPLE         fred                          2019-12-03 21:29:01 0                                            
LDAP        10.129.254.250  389    EXAMPLE         angela                        2019-12-03 21:29:43 0                                            
LDAP        10.129.254.250  389    EXAMPLE         felicia                       2019-12-03 21:30:53 0                                            
LDAP        10.129.254.250  389    EXAMPLE         gustavo                       2019-12-03 21:31:42 0                                            
LDAP        10.129.254.250  389    EXAMPLE         ulf                           2019-12-03 21:32:19 0                                            
LDAP        10.129.254.250  389    EXAMPLE         stevie                        2019-12-03 21:33:13 0                                            
LDAP        10.129.254.250  389    EXAMPLE         claire                        2019-12-03 21:33:44 0                                            
LDAP        10.129.254.250  389    EXAMPLE         paulo                         2019-12-03 21:34:46 0                                            
LDAP        10.129.254.250  389    EXAMPLE         steve                         2019-12-03 21:35:25 0                                            
LDAP        10.129.254.250  389    EXAMPLE         annette                       2019-12-03 21:36:55 0                                            
LDAP        10.129.254.250  389    EXAMPLE         annika                        2019-12-03 21:37:23 0                                            
LDAP        10.129.254.250  389    EXAMPLE         per                           2019-12-03 21:38:12 0                                            
LDAP        10.129.254.250  389    EXAMPLE         claude                        2019-12-03 21:39:56 0                                            
LDAP        10.129.254.250  389    EXAMPLE         melanie                       2024-12-22 12:47:02 0                                            
LDAP        10.129.254.250  389    EXAMPLE         zach                          2019-12-04 10:39:27 0                                            
LDAP        10.129.254.250  389    EXAMPLE         simon                         2019-12-04 10:39:58 0                                            
LDAP        10.129.254.250  389    EXAMPLE         naoki                         2019-12-04 10:40:44 0                                            
$ 
```
### impacket-GetADUsers
```
impacket-GetADUsers -all example.htb/svc_tgs -dc-ip 10.129.237.154
```
Example output:
```
$ impacket-GetADUsers -all example.htb/svc_tgs -dc-ip 10.129.237.154
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

Password:
[*] Querying 10.129.237.154 for information about domain.
Name                  Email                           PasswordLastSet      LastLogon           
--------------------  ------------------------------  -------------------  -------------------
Administrator                                         2018-07-18 14:06:40.351723  2024-11-13 18:41:02.409351 
Guest                                                 <never>              <never>             
krbtgt                                                2018-07-18 13:50:36.972031  <never>             
SVC_TGS                                               2018-07-18 15:14:38.402764  2018-07-21 09:01:30.320277 
$
```
