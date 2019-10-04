# List Process Lists (process name, id , path)
Write-Host ("Listing all Processes")
sleep 2
Get-Process | Where-Object {$_.mainWindowTitle} | Format-Table Id, Name, mainWindowtitle -AutoSize | Sort-Object Username | Export-Csv -NoTypeInformation -Path "$($env:USERPROFILE)\Documents\Powershell\Week3\AllProcesses.csv"
Write-Host ("Process list gathered and saved to Desktop")
sleep 2

# List all services (processname, id, path)
Write-Host ("Listing all services")
sleep 2
Get-Process -IncludeUserName | Select-Object Id,Name,Username,Path | Sort-Object Username | Export-Csv -NoTypeInformation -Path "$($env:USERPROFILE)\Documents\Powershell\Week3\AllServices.csv"
Write-Host ("Services list gathered and saved to Desktop")
sleep 2

# List all running services
Write-Host ("Listing all running services")
sleep 2
Get-Service | Where-Object {$_.Status -eq "Running"} | Export-Csv -NoTypeInformation -Path "$($env:USERPROFILE)\Documents\Powershell\Week3\LiveServices.csv"
Write-Host ("Running services list gathered and saved to Desktop")
sleep 2

# List all users
Write-Host ("Listing all users")
sleep 2
Get-WmiObject -Class Win32_UserAccount | Select Name, SID, AccountType, Domain | Export-Csv -NoTypeInformation -Path "$($env:USERPROFILE)\Documents\Powershell\Week3\Users.csv"
Write-Host ("User list gathered and saved to Desktop")
sleep 2

# List all installed software
Write-Host ("Listing all installed software")
sleep 2
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize | Export-Csv -NoTypeInformation -Path "$($env:USERPROFILE)\Documents\Powershell\Week3\InstalledSoftware.csv"
Write-Host ("Installed software list gathered and saved to Desktop")
sleep 2

# List all current TCP connections
Write-Host ("Listing all TCP connections")
sleep 2
Get-NetTCPConnection | Export-Csv -NoTypeInformation -Path "$($env:USERPROFILE)\Documents\Powershell\Week3\TCP.csv"
Write-Host ("TCP connections list gathered and saved to Desktop")
sleep 2