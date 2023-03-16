# Name: Tattoo
# Authors: Joshua Winters-Brown
# Description: This script tattoos the registry with deployment variables during the operating system deployment.

# All of our information will live within this Registry Folder :)
$full_registry_key_name = "HKLM:\SOFTWARE\KVCC"

# Create the new Registry Key Location
New-Item -Path $full_registry_key_name -type Directory -Force -ErrorAction SilentlyContinue

# Get Values to Tattoo
$install_date = Get-Date
$task_sequence_name = "Joshuas Tattoo Test"
$task_sequence_id = "TS0000000"
$asset_tag = 612435
$device_name = $env:computername


# Write Values to Registry
New-ItemProperty $full_registry_key_name -Name "Installed Date" -Value $install_date -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed Name" -Value $task_sequence_name -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed ID" -Value $task_sequence_id -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Asset Tag" -Value $asset_tag -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Name" -Value $device_name -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null