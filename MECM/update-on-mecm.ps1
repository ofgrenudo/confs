# Notes: https://doitpsway.com/getting-information-from-sccm-administration-service-api#1-find-out-where-the-information-you-need-is-stored

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

$device_name = $env:computername
$c = Get-Credential kvcc.dom\
$site_server = "https://contour/AdminService/v1.0"

$route =  $site_server + "/Device/" # This URL pulls all devices from contour
$device_info_from_mecm = Invoke-RestMethod -Method 'GET' -Uri $route -Credential $c # Connect to Contour with a credential entered earlier
$device_raw = $device_info_from_mecm | Select-Object -ExpandProperty Value | Where-Object Name -eq $device_name # Filter through our JSON var and find the object for our device.
$device_resource_id = $device_raw | Select-Object -ExpandProperty MachineID


# Sending Asset Tag Information 
# Link: https://learn.microsoft.com/en-us/mem/configmgr/develop/adminservice/custom-properties#set-properties-via-api
$device_parameters = "{ 'ExtensionData': { 'AssetTag':'12345'} }"

$route = $site_server + "/Device($device_resource_id)/AdminService.SetExtensionData"
$update_device_info = Invoke-RestMethod -Method 'POST' -Uri $route -Credential $c -Body $device_parameters -ContentType 'application/json'

# Check Asset Tag Information
# Link: https://learn.microsoft.com/en-us/mem/configmgr/develop/adminservice/custom-properties#view-properties
$route = $site_server + "/Device($device_resource_id)/AdminService.GetExtensionData"
$get_device_info = Invoke-RestMethod -Method 'GET' -Uri $route -Credential $c

Write-Output $get_device_info


