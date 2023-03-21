# Name: Check Tatto
# Authors: Joshua Winters-Brown
# Description: This script checks your MECM server for any Extension data that may have been submitted, and spits it out into the terminal
# Link: https://github.com/ofgrenudo/confs/blob/main/MECM/check-tattoo.ps1

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

$credentials = Get-Credential kvcc.dom\
$site_server = "https://contour/AdminService/v1.0"

# Get all devices and then sort for our device name
$route =  $site_server + "/Device/" # This URL pulls all devices from contour
$device_list = Invoke-RestMethod -Method 'GET' -Uri $route -Credential $credentials # Connect to Contour with a credential entered earlier
$device_raw = $device_list | Select-Object -ExpandProperty Value | Where-Object Name -eq $device_name # Filter through our JSON var and find the object for our device.
$device_resource_id = $device_raw | Select-Object -ExpandProperty MachineID

# Check our device Extension Data was set :) 
# Link: https://learn.microsoft.com/en-us/mem/configmgr/develop/adminservice/custom-properties#view-properties
$route = $site_server + "/Device($device_resource_id)/AdminService.GetExtensionData"
$get_device_info = Invoke-RestMethod -Method 'GET' -Uri $route -Credential $credentials
$get_device_info | Out-GridView