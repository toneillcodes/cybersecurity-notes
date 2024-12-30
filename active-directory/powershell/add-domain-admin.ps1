$Name = "testuser"
$Domain = "example.local"
$Password = "Password123"
$SecurePass = ConvertTo-SecureString -String $Password -AsPlainText -Force
$NewUser = New-ADUser -Name "$Name" -SamAccountName "$Name" -UserPrincipalName "$Name@$Domain" -AccountPassword $SecurePass;
Enable-ADAccount -Identity "$Name"
Add-ADGroupMember -Identity "Domain Admins" -Members "$Name"
