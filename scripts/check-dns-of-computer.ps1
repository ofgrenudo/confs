<#
Author: Joshua Winters-Brown
check-dns-of-computer.ps1 (c) 2022
Description: Check the DNS of remote computer using powershell.
Created:  2022-02-09T13:09:18.553Z
#>
$computerName = Read-Host "Enter Target Computer Name"
Enter-PSSession $computerName
Get-DnsClientServerAddress | Select-Object -ExpandProperty ServerAddresses
Exit-PSSession