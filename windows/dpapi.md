# Data Protection API (DPAPI)

".NET provides access to the data protection API (DPAPI), which allows you to encrypt data using information from 
the current user account or computer. When you use the DPAPI, you alleviate the difficult problem of explicitly 
generating and storing a cryptographic key."
Reference: [Microsoft: How To Use Data Protection](https://learn.microsoft.com/en-us/dotnet/standard/security/how-to-use-data-protection)

"Use the ProtectedData class to encrypt a copy of an array of bytes. You can specify that data encrypted by the 
current user account can be decrypted only by the same user account, or you can specify that data encrypted by 
the current user account can be decrypted by any account on the computer. See the DataProtectionScope enumeration 
for a detailed description of ProtectedData options."
Reference: [Microsoft: How To Use Data Protection](https://learn.microsoft.com/en-us/dotnet/standard/security/how-to-use-data-protection)

The ProtectedMemory class "provides methods for protecting and unprotecting memory"

The classes consist of two wrappers for the unmanaged DPAPI: Protect and Unprotect. 
These two methods can be used to encrypt and decrypt data such as passwords, keys, and connection strings.

[.NET ProtectedData Class](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.protecteddata?view=netframework-4.8.1)
[.NET ProtectedMemory Class](https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.protectedmemory?view=netframework-4.8.1)
