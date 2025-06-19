# Name: delete-profiles.ps1
# Authors: Joshua Winters-Brown
# Description: This script deletes user profiles files as well as the associated registry key.
# Link: https://github.com/ofgrenudo/confs/blob/main/MECM/delete-profiles.ps1

$DoNotDelete = @("NetworkService", "LocalService", "systemprofile", "shiftyfox", "administrator")
$AllLocalProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -notin $DoNotDelete}
$SelectedProfiles = $AllLocalProfiles | Select PSComputerName, LocalPath, LastUseTime, SID | Out-GridView -PassThru -Title "Please select profiles to delete"

if ($SelectedProfiles) {
    Get-WmiObject Win32_UserProfile | ? { ($_.SID -in $SelectedProfiles.SID) -and ($_.LocalPath -in $SelectedProfiles.LocalPath) } | % { 
        $_.Delete()
        Write-Host "Deleting $_.LocalPath" 
    }
} else {
    Write-Output "No profiles selected... Please try again :)"
}