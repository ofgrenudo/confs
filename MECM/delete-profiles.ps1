# Name: delte-profiles.ps1
# Authors: Joshua Winters-Brown
# Description: This script deletes user profiles files as well as the associated registry key.
# Link: https://github.com/ofgrenudo/confs/blob/main/MECM/delete-profiles.ps1

$DoNotDelete = @("NetworkService", "LocalService", "systemprofile", "cnmlab", "shiftyfox")

$deleteProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -notin $DoNotDelete} | Select PSComputerName, LocalPath, LastUseTime, SID | Out-GridView -PassThru -Title "Select profiles to delete"
if ($deleteProfiles) {
    Write-Output "The following profiles will be deleted:"
    $deleteProfiles | % { $_.LocalPath }
    Read-Host "Press ENTER to delete, or CTRL+C to exit"
    Get-WmiObject Win32_UserProfile | ? { ($_.SID -in $deleteProfiles.SID) -and ($_.LocalPath -in $deleteProfiles.LocalPath) } | % { $_.Delete() }
} else {
    Write-Output "No profiles selected"
}