# Server Message Block
Server Message Block (SMB) is a network protocol that allows devices to share files, printers, and other resources across a network.
## user enumeration
### netexec
requires credentials
Enumerate users
Example output:
```
┌──(kali㉿kali)-[~]
└─$ nxc smb 10.0.2.15 -d marvel.local -u fcastle -p Password1 --users
SMB         10.0.2.15       445    HYDRA-DC         [*] Windows 10.0 Build 26100 x64 (name:HYDRA-DC) (domain:MARVEL.local) (signing:True) (SMBv1:False)
SMB         10.0.2.15       445    HYDRA-DC         [+] marvel.local\fcastle:Password1 
SMB         10.0.2.15       445    HYDRA-DC         -Username-                    -Last PW Set-       -BadPW- -Description-                               
SMB         10.0.2.15       445    HYDRA-DC         Administrator                 2024-12-10 02:48:15 0       Built-in account for administering the computer/domain                                                                                                                                                
SMB         10.0.2.15       445    HYDRA-DC         Guest                         <never>             0       Built-in account for guest access to the computer/domain                                                                                                                                              
SMB         10.0.2.15       445    HYDRA-DC         krbtgt                        2024-12-10 03:00:30 0       Key Distribution Center Service Account 
SMB         10.0.2.15       445    HYDRA-DC         tstark                        2024-12-12 05:16:09 0        
SMB         10.0.2.15       445    HYDRA-DC         sqlservice                    2024-12-12 05:17:51 0       password is MYpassword123# 
SMB         10.0.2.15       445    HYDRA-DC         fcastle                       2024-12-12 05:19:30 0        
SMB         10.0.2.15       445    HYDRA-DC         pparker                       2024-12-12 05:21:36 0        
SMB         10.0.2.15       445    HYDRA-DC         [*] Enumerated 7 local users: MARVEL
                                                                                                                                                          
┌──(kali㉿kali)-[~]
└─$
```
RID Brute
```
nxc smb 10.0.2.15 -d marvel.local -u fcastle -p Password1 --rid-brute
```
Example output:
```
┌──(kali㉿kali)-[~]
└─$ nxc smb 10.0.2.15 -d marvel.local -u fcastle -p Password1 --rid-brute        
SMB         10.0.2.15       445    HYDRA-DC         [*] Windows 10.0 Build 26100 x64 (name:HYDRA-DC) (domain:MARVEL.local) (signing:True) (SMBv1:False)
SMB         10.0.2.15       445    HYDRA-DC         [+] marvel.local\fcastle:Password1 
SMB         10.0.2.15       445    HYDRA-DC         498: MARVEL\Enterprise Read-only Domain Controllers (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         500: MARVEL\Administrator (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         501: MARVEL\Guest (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         502: MARVEL\krbtgt (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         512: MARVEL\Domain Admins (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         513: MARVEL\Domain Users (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         514: MARVEL\Domain Guests (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         515: MARVEL\Domain Computers (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         516: MARVEL\Domain Controllers (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         517: MARVEL\Cert Publishers (SidTypeAlias)
SMB         10.0.2.15       445    HYDRA-DC         518: MARVEL\Schema Admins (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         519: MARVEL\Enterprise Admins (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         520: MARVEL\Group Policy Creator Owners (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         521: MARVEL\Read-only Domain Controllers (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         522: MARVEL\Cloneable Domain Controllers (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         525: MARVEL\Protected Users (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         526: MARVEL\Key Admins (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         527: MARVEL\Enterprise Key Admins (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         528: MARVEL\Forest Trust Accounts (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         529: MARVEL\External Trust Accounts (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         553: MARVEL\RAS and IAS Servers (SidTypeAlias)
SMB         10.0.2.15       445    HYDRA-DC         571: MARVEL\Allowed RODC Password Replication Group (SidTypeAlias)
SMB         10.0.2.15       445    HYDRA-DC         572: MARVEL\Denied RODC Password Replication Group (SidTypeAlias)
SMB         10.0.2.15       445    HYDRA-DC         1000: MARVEL\HYDRA-DC$ (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         1101: MARVEL\DnsAdmins (SidTypeAlias)
SMB         10.0.2.15       445    HYDRA-DC         1102: MARVEL\DnsUpdateProxy (SidTypeGroup)
SMB         10.0.2.15       445    HYDRA-DC         1103: MARVEL\tstark (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         1104: MARVEL\sqlservice (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         1105: MARVEL\fcastle (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         1106: MARVEL\pparker (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         1107: MARVEL\PUNISHER$ (SidTypeUser)
SMB         10.0.2.15       445    HYDRA-DC         1108: MARVEL\SPIDERMAN$ (SidTypeUser)
                                                                                                                                                          
┌──(kali㉿kali)-[~]
└─$ 
```
