<#
Author: Joshua Winters-Brown
check-user-account-information.ps1 (c) 2022
Description: Check some general user information from a csv
Created:  2022-02-25T17:28:25.061Z
#>

$filePath = Read-Host "Enter file path to a new line seperated file"

Get-Content $filePath | ForEach-Object {
    $output = Get-ADUser -Identity $_.ToString() -Properties "LastLogonDate"
    Write-Host $output
    Add-Content .\user-account-information.txt $output
}