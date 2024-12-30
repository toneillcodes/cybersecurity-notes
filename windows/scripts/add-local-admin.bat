net user /add "testuser" "Password123"
net localgroup administrators "testuser" /add
net localgroup "Remote Desktop Users" "testuser" /add
