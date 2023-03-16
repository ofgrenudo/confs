# Name: Tattoo
# Authors: Joshua Winters-Brown
# Description: This script tattoos the registry with deployment variables during the operating system deployment.

# Get Task Sequence Variables
# Note, this script is looking for a few specific task sequence variables
# 1. _SMSTSPackageName
# 2. _SMSTSPackageID
# 3. OSDAssetTag (Custom must add to collection properties)
# 4. OSDStartTime
# 5. OSDCOMPUTERNAME (Most people will already be setting this.)
# Note: Not setting any of these values wont necesarilly crash the deployment or program, but it will not report approriately in the registry.
$ts_env = New-Object -COMObject Microsoft.SMS.TSEnvironment

# All of our information will live within this Registry Folder :)
$full_registry_key_name = "HKLM:\SOFTWARE\KVCC"

# Create the new Registry Key Location
New-Item -Path $full_registry_key_name -type Directory -Force -ErrorAction SilentlyContinue

# Sets values for script to tattoo
$install_date = Get-Date
$task_sequence_name = $ts_env.Value("_SMSTSPackageName")
$task_sequence_id = $ts_env.Value("_SMSTSPackageID")
$asset_tag = $ts_env.Value("OSDAssetTag")
$device_name = $env:computername
$serial_number = Get-WmiObject win32_bios | Select SerialNumber
$device_model = Get-WmiObject -Class Win32_ComputerSystem | Select -ExpandProperty Model
$device_make = Get-WmiObject -Class Win32_ComputerSystem | Select -ExpandProperty Manufacturer

# Write Values to Registry
New-ItemProperty $full_registry_key_name -Name "Deployment Date" -Value $install_date -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed Name" -Value $task_sequence_name -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed ID" -Value $task_sequence_id -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Asset Tag" -Value $asset_tag -Type String -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Name" -Value $device_name -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Serial Number" -Value $serial_number -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Model" -Value $device_model -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Make" -Value $device_make -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null