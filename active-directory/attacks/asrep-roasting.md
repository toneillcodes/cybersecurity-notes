# AS-REP Roasting
## Enumeration
### PowerShell
```
Get-Domainuser | Where-Object { $_.UserAccountControl -like "*DONT_REQ_PREAUTH"}
```
## Attack Overview
Using Rubeus
## Tools
- Rubeus
