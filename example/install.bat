powershell -command "Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"
powershell -command "Start-Service sshd"
powershell -command "Set-Service -Name sshd -StartupType 'Automatic'"
