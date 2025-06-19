<#
Author: Joshua Winters-Brown
rename-computer.ps1 (c) 2022
Description: Rename Remote Windows Computers
Created:  2022-03-15T16:25:21.288Z
#>

while (1) {

    $targetComputer = Read-Host "What is the target computer name?"
    
    $validComputerName = 0
    while($validComputerName -eq 0) {
        # Test if computer is alive
        if (Test-Connection -BufferSize 32 -Count 1 -ComputerName $targetComputer -Quiet) {
                Write-Host "The remote machine $targetComputer is alive." -ForegroundColor Yellow
                $validComputerName = 1
            } 
        else {
                Write-Host "The remote machine $targetComputer is dead. Please check internet status and try again :)" -ForegroundColor Yellow
                $targetComputer = Read-Host "What is the target computer name?"
        }
    }

    $newName = Read-Host "What would you like to rename the computer to?"

    # Test if computer already exists with this name
    if (Test-Connection -BufferSize 32 -Count 1 -ComputerName $newName -Quiet) {
        Write-Host "There exists a computer already by the name $newName, are you sure you want to continue?" -ForegroundColor Yellow
        $anwser = Read-Host "yes/no"
        if ($anwser -like "*n*") {
            Exit 130
        }
    }

    # Capture domain admin credentials
    $domainAdmin = Get-Credential -UserName "yourdomain\" -Message 'Enter domain admin account information'

    # Issue rename command
    Rename-Computer -ComputerName $targetComputer -NewName $newName -DomainCredential $domainAdmin -Force
}
