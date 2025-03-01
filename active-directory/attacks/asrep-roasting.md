# AS-REP Roasting
## Summary
AS-REP
## Attack Requirements
- Target account
## Enumeration Methods
### PowerSploit
```
Get-Domainuser | Where-Object { $_.UserAccountControl -like "*DONT_REQ_PREAUTH"}
```
## Attack Overview
Using Rubeus
## Tools
- Rubeus
