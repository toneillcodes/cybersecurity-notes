$Name = "testuser"
$Password = "Password123"
$SecurePass = ConvertTo-SecureString -String $Password -AsPlainText -Force
New-LocalUser -Name $Name -Password $SecurePass
Add-LocalGroupMember -Group "Administrators" -Member "testuser"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "testuser"
