# Set the path to your CSV file
$csvFilePath = "hostnames.csv"

# Read the CSV file
$computers = Import-Csv -Path $csvFilePath

# Iterate through each computer in the CSV
foreach ($computer in $computers) {
    $computerName = $computer.ComputerName

    # Check if the computer is reachable via ping
    if (Test-Connection -ComputerName $computerName -Count 2 -Quiet) {
        # Run the command for each computer
        $biosInfo = Get-CimInstance -ClassName Win32_BIOS -ComputerName $computerName

        # Output the serial number
        Write-Host "Computer: $computerName"
        Write-Host "Serial Number: $($biosInfo.SerialNumber)"
        Write-Host "------------------------"
    }
    else {
        # Log an error if the computer cannot be pinged
        Write-Host "Error: Cannot ping computer '$computerName'. Please turn the device on."
        Write-Host "------------------------"
    }
}

