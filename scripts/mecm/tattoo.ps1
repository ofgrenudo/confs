# Name: Tattoo
# Authors: Joshua Winters-Brown
# Description: This script tattoos the registry with deployment variables during the operating system deployment.
# Link: https://github.com/ofgrenudo/confs/blob/main/MECM/tattoo.ps1

# If you are using powershell v5 like me, you will need this code block to allow connections to insecure (IE self signed certs)
$code= @"
        using System.Net;
        using System.Security.Cryptography.X509Certificates;
        public class TrustAllCertsPolicy : ICertificatePolicy {
            public bool CheckValidationResult(ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem) {
                return true;
            }
        }
"@
Add-Type -TypeDefinition $code -Language CSharp
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

# Get Task Sequence Variables
# Note, this script is looking for a few specific task sequence variables
# 1. _SMSTSPackageName
# 2. _SMSTSPackageID
# 3. OSDAssetTag (Custom must add to collection properties)
# 4. OSDStartTime
# 5. OSDCOMPUTERNAME (Most people will already be setting this.)
# Note: Not setting any of these values wont necesarilly crash the deployment or program, but it will not report approriately in the registry.
$ts_env = New-Object -COMObject Microsoft.SMS.TSEnvironment
$site_server = "https://contour/AdminService/v1.0"
# Sets values for script to tattoo
$install_date = Get-Date
$task_sequence_name = $ts_env.Value("_SMSTSPackageName")
$task_sequence_id = $ts_env.Value("_SMSTSPackageID")
$asset_tag = $ts_env.Value("OSDAssetTag")
$device_name = $env:computername
$serial_number = Get-WmiObject win32_bios | Select -ExpandProperty SerialNumber
$device_model = Get-WmiObject -Class Win32_ComputerSystem | Select -ExpandProperty Model
$device_make = Get-WmiObject -Class Win32_ComputerSystem | Select -ExpandProperty Manufacturer
# All of our information will live within this Registry Folder :)
$full_registry_key_name = "HKLM:\SOFTWARE\KVCC"
# Create the new Registry Key Location
New-Item -Path $full_registry_key_name -type Directory -Force -ErrorAction SilentlyContinue

# Write Values to Registry
New-ItemProperty $full_registry_key_name -Name "Deployment Date" -Value $install_date -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed Name" -Value $task_sequence_name -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed ID" -Value $task_sequence_id -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Asset Tag" -Value $asset_tag -Type String -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Name" -Value $device_name -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Serial Number" -Value $serial_number -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Model" -Value $device_model -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Make" -Value $device_make -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null

# Get and store credentials for web requests
# How to encrypt your password for scripts :) 
# Link: https://interworks.com/blog/trhymer/2013/07/08/powershell-how-encrypt-and-store-credentials-securely-use-automation-scripts/
$credentials = New-Object System.Management.Automation.PsCredential("username", "encrypted-password")
# Get all devices and then sort for our device name
$route =  $site_server + "/Device/" # This URL pulls all devices from contour
$device_list = Invoke-RestMethod -Method 'GET' -Uri $route -Credential $credentials # Connect to Contour with a credential entered earlier
$device_raw = $device_list | Select-Object -ExpandProperty Value | Where-Object Name -eq $device_name # Filter through our JSON var and find the object for our device.
$device_resource_id = $device_raw | Select-Object -ExpandProperty MachineID

# Update our device Extension Data with Asset Tag
# Link: https://learn.microsoft.com/en-us/mem/configmgr/develop/adminservice/custom-properties#set-properties-via-api
$device_parameters = "{ 'ExtensionData': { 'AssetTag':'$asset_tag', 'Model':'$device_model', 'Make':'$device_make', 'Install Date':'$install_date', 'Task Sequence Deployment Name':'$task_sequence_name', 'Task Sequence Deployment ID': '$task_sequence_id'} }"
$route = $site_server + "/Device($device_resource_id)/AdminService.SetExtensionData"
Invoke-RestMethod -Method 'POST' -Uri $route -Credential $credentials -Body $device_parameters -ContentType 'application/json'