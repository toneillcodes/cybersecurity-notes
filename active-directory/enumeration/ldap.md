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
Lookup user objects
```
ldapsearch -x -H ldap://10.129.237.154 -D 'SVC_TGS' -w 'Password123' -b "DC=example,DC=htb" "(objectClass=user)"
```

Lookup users, ignore inactive accounts (useraccountcontrol=2)
```
ldapsearch -x -H 'ldap://10.129.237.154' -D 'SVC_TGS' -w 'Password123' -b "dc=example,dc=htb" -s sub "(&(objectCategory=person)(objectClass=user)(!(useraccountcontrol:1.2.840.113556.1.4.803:=2)))" samaccountname | grep sAMAccountNameccountName
```
```
$ ldapsearch -x -H 'ldap://10.129.237.154' -D 'SVC_TGS' -w 'Password123' -b "dc=example,dc=htb" -s sub "(&(objectCategory=person)(objectClass=user)(!(useraccountcontrol:1.2.840.113556.1.4.803:=2)))" samaccountname | grep sAMAccountNameccountName
sAMAccountName: Administrator
sAMAccountName: SVC_TGS
$ 
```
### enum4linux
```
enum4linux -u testuser -p Password123 10.129.121.92
```
Example output:
```
┌──(kali㉿kali)-[~]
└─$ enum4linux 10.0.2.15 -u fcastle -p Password1
Starting enum4linux v0.9.1 ( http://labs.portcullis.co.uk/application/enum4linux/ ) on Sun Feb  2 12:11:49 2025

 =========================================( Target Information )=========================================
                                                                                                                                                          
Target ........... 10.0.2.15                                                                                                                              
RID Range ........ 500-550,1000-1050
Username ......... ''
Password ......... ''
Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none


 =============================( Enumerating Workgroup/Domain on 10.0.2.15 )=============================
                                                                                                                                                          
                                                                                                                                                          
[+] Got domain/workgroup name: MARVEL                                                                                                                     
                                                                                                                                                          
                                                                                                                                                          
 =================================( Nbtstat Information for 10.0.2.15 )=================================
                                                                                                                                                          
Looking up status of 10.0.2.15                                                                                                                            
        HYDRA-DC        <00> -         B <ACTIVE>  Workstation Service
        MARVEL          <00> - <GROUP> B <ACTIVE>  Domain/Workgroup Name
        MARVEL          <1c> - <GROUP> B <ACTIVE>  Domain Controllers
        HYDRA-DC        <20> -         B <ACTIVE>  File Server Service
        MARVEL          <1b> -         B <ACTIVE>  Domain Master Browser

        MAC Address = 08-00-27-B1-B8-2C

 =====================================( Session Check on 10.0.2.15 )=====================================
                                                                                                                                                          
                                                                                                                                                          
[+] Server 10.0.2.15 allows sessions using username '', password ''                                                                                       
                                                                                                                                                          
                                                                                                                                                          
 ==================================( Getting domain SID for 10.0.2.15 )==================================
                                                                                                                                                          
Domain Name: MARVEL                                                                                                                                       
Domain Sid: S-1-5-21-2581533897-608573359-3386076638

[+] Host is part of a domain (not a workgroup)                                                                                                            
                                                                                                                                                          
                                                                                                                                                          
 ====================================( OS information on 10.0.2.15 )====================================
                                                                                                                                                          
                                                                                                                                                          
[E] Can't get OS info with smbclient                                                                                                                      
                                                                                                                                                          
                                                                                                                                                          
[+] Got OS info for 10.0.2.15 from srvinfo:                                                                                                               
do_cmd: Could not initialise srvsvc. Error was NT_STATUS_ACCESS_DENIED                                                                                    


 =========================================( Users on 10.0.2.15 )=========================================
                                                                                                                                                          
                                                                                                                                                          
[E] Couldn't find users using querydispinfo: NT_STATUS_ACCESS_DENIED                                                                                      
                                                                                                                                                          
                                                                                                                                                          

[E] Couldn't find users using enumdomusers: NT_STATUS_ACCESS_DENIED                                                                                       
                                                                                                                                                          
                                                                                                                                                          
 ===================================( Share Enumeration on 10.0.2.15 )===================================
                                                                                                                                                          
do_connect: Connection to 10.0.2.15 failed (Error NT_STATUS_RESOURCE_NAME_NOT_FOUND)                                                                      

        Sharename       Type      Comment
        ---------       ----      -------
Reconnecting with SMB1 for workgroup listing.
Unable to connect with SMB1 -- no workgroup available

[+] Attempting to map shares on 10.0.2.15                                                                                                                 
                                                                                                                                                          
                                                                                                                                                          
 =============================( Password Policy Information for 10.0.2.15 )=============================
                                                                                                                                                          
                                                                                                                                                          
[E] Unexpected error from polenum:                                                                                                                        
                                                                                                                                                          
                                                                                                                                                          

[+] Attaching to 10.0.2.15 using a NULL share

[+] Trying protocol 139/SMB...

        [!] Protocol failed: Cannot request session (Called Name:10.0.2.15)

[+] Trying protocol 445/SMB...

        [!] Protocol failed: SAMR SessionError: code: 0xc0000022 - STATUS_ACCESS_DENIED - {Access Denied} A process has requested access to an object but has not been granted those access rights.



[E] Failed to get password policy with rpcclient                                                                                                          
                                                                                                                                                          
                                                                                                                                                          

 ========================================( Groups on 10.0.2.15 )========================================
                                                                                                                                                          
                                                                                                                                                          
[+] Getting builtin groups:                                                                                                                               
                                                                                                                                                          
                                                                                                                                                          
[+]  Getting builtin group memberships:                                                                                                                   
                                                                                                                                                          
                                                                                                                                                          
[+]  Getting local groups:                                                                                                                                
                                                                                                                                                          
                                                                                                                                                          
[+]  Getting local group memberships:                                                                                                                     
                                                                                                                                                          
                                                                                                                                                          
[+]  Getting domain groups:                                                                                                                               
                                                                                                                                                          
                                                                                                                                                          
[+]  Getting domain group memberships:                                                                                                                    
                                                                                                                                                          
                                                                                                                                                          
 ====================( Users on 10.0.2.15 via RID cycling (RIDS: 500-550,1000-1050) )====================
                                                                                                                                                          
                                                                                                                                                          
[E] Couldn't get SID: NT_STATUS_ACCESS_DENIED.  RID cycling not possible.                                                                                 
                                                                                                                                                          
                                                                                                                                                          
 =================================( Getting printer info for 10.0.2.15 )=================================
                                                                                                                                                          
do_cmd: Could not initialise spoolss. Error was NT_STATUS_ACCESS_DENIED                                                                                   


enum4linux complete on Sun Feb  2 12:11:50 2025

                                                                                                                                                          
┌──(kali㉿kali)-[~]
└─$ 
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
Example output:
```
┌──(kali㉿kali)-[~]
└─$ nxc ldap 10.0.2.15 -d marvel.local -u fcastle -p Password1 --users
SMB         10.0.2.15       445    HYDRA-DC         [*] Windows 10.0 Build 26100 x64 (name:HYDRA-DC) (domain:MARVEL.local) (signing:True) (SMBv1:False)
LDAPS       10.0.2.15       636    HYDRA-DC         [+] marvel.local\fcastle:Password1 
LDAPS       10.0.2.15       636    HYDRA-DC         [*] Enumerated 7 domain users: marvel.local
LDAPS       10.0.2.15       636    HYDRA-DC         -Username-                    -Last PW Set-       -BadPW- -Description-                               
LDAPS       10.0.2.15       636    HYDRA-DC         Administrator                 2024-12-10 02:48:15 0       Built-in account for administering the computer/domain                                                                                                                                                
LDAPS       10.0.2.15       636    HYDRA-DC         Guest                         <never>             0       Built-in account for guest access to the computer/domain                                                                                                                                              
LDAPS       10.0.2.15       636    HYDRA-DC         krbtgt                        2024-12-10 03:00:30 0       Key Distribution Center Service Account     
LDAPS       10.0.2.15       636    HYDRA-DC         tstark                        2024-12-12 05:16:09 0                                                   
LDAPS       10.0.2.15       636    HYDRA-DC         sqlservice                    2024-12-12 05:17:51 0       password is MYpassword123#                  
LDAPS       10.0.2.15       636    HYDRA-DC         fcastle                       2024-12-12 05:19:30 0                                                   
LDAPS       10.0.2.15       636    HYDRA-DC         pparker                       2024-12-12 05:21:36 0                                                   
                                                                                                                                                          
┌──(kali㉿kali)-[~]
└─$ 
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
