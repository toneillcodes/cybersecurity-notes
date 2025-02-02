# Server Message Block
Server Message Block (SMB) is a network protocol that allows devices to share files, printers, and other resources across a network.
## user enumeration
### netexec
requires credentials
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
