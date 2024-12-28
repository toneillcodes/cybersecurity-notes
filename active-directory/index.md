# Active Directory Overview # 

Physical
	Data Store
	Domain Controllers
	Read Only Domain Controllers
Logical
	Partitions
	Schema
	Domains
	Domain Trees
	Forests
	Sites
	Organizational Units
	

AD DS data store:
	%SystemRoot%\NTDS\ntds.dit

## Schema ##
Class Objects, ex:	user
Attribute Objects, ex:	displayName

## Enumeration tools ##
Bloodhound
Plumhound
	ingests bloodhound db
ldapdomaindump
	default kali tool, requires LDAP and credentials
PingCastle
	requires license for commercial use
