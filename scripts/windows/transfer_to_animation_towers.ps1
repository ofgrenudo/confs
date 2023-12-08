<#
SKIP THE FUNCTION, DO NOT START YOUR PROGRAM HERE. POWERSHELL IS STUPID AND RUNS CODE FROM TOP TO BOTTOM SO THE FUNCTION NEEDS TO EXIST HERE.
#>

function TransferFiles($full_path) {

    Write-Host "Transfering to CNM-275 Animation Towers"

    if (Test-Connection -ComputerName CNM-275-10 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-275-10\C$\kvcc } else { Write-Host "!`tCNM-275-10 is offline" }
    if (Test-Connection -ComputerName CNM-275-11 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-275-11\C$\kvcc } else { Write-Host "!`tCNM-275-11 is offline" }
    if (Test-Connection -ComputerName CNM-275-12 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-275-12\C$\kvcc } else { Write-Host "!`tCNM-275-12 is offline" }
    if (Test-Connection -ComputerName CNM-275-13 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-275-13\C$\kvcc } else { Write-Host "!`tCNM-275-13 is offline" }
    if (Test-Connection -ComputerName CNM-275-14 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-275-14\C$\kvcc } else { Write-Host "!`tCNM-275-14 is offline" }
    if (Test-Connection -ComputerName CNM-275-15 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-275-15\C$\kvcc } else { Write-Host "!`tCNM-275-15 is offline" }

    Write-Host "Transfering to CNM-070 Animation Towers"

    if (Test-Connection -ComputerName CNM-070-01 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-01\C$\kvcc } else { Write-Host "!`tCNM-070-01 is offline" }
    if (Test-Connection -ComputerName CNM-070-02 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-02\C$\kvcc } else { Write-Host "!`tCNM-070-02 is offline" }
    if (Test-Connection -ComputerName CNM-070-03 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-03\C$\kvcc } else { Write-Host "!`tCNM-070-03 is offline" }
    if (Test-Connection -ComputerName CNM-070-04 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-04\C$\kvcc } else { Write-Host "!`tCNM-070-04 is offline" }
    if (Test-Connection -ComputerName CNM-070-05 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-05\C$\kvcc } else { Write-Host "!`tCNM-070-05 is offline" }
    if (Test-Connection -ComputerName CNM-070-06 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-06\C$\kvcc } else { Write-Host "!`tCNM-070-06 is offline" }
    if (Test-Connection -ComputerName CNM-070-07 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-07\C$\kvcc } else { Write-Host "!`tCNM-070-07 is offline" }
    if (Test-Connection -ComputerName CNM-070-08 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-08\C$\kvcc } else { Write-Host "!`tCNM-070-08 is offline" }
    if (Test-Connection -ComputerName CNM-070-09 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-09\C$\kvcc } else { Write-Host "!`tCNM-070-09 is offline" }
    if (Test-Connection -ComputerName CNM-070-10 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-10\C$\kvcc } else { Write-Host "!`tCNM-070-10 is offline" }
    if (Test-Connection -ComputerName CNM-070-11 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-11\C$\kvcc } else { Write-Host "!`tCNM-070-11 is offline" }
    if (Test-Connection -ComputerName CNM-070-12 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-12\C$\kvcc } else { Write-Host "!`tCNM-070-12 is offline" }
    if (Test-Connection -ComputerName CNM-070-13 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-13\C$\kvcc } else { Write-Host "!`tCNM-070-13 is offline" }
    if (Test-Connection -ComputerName CNM-070-14 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-14\C$\kvcc } else { Write-Host "!`tCNM-070-14 is offline" }
    if (Test-Connection -ComputerName CNM-070-15 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-15\C$\kvcc } else { Write-Host "!`tCNM-070-15 is offline" }
    if (Test-Connection -ComputerName CNM-070-16 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-16\C$\kvcc } else { Write-Host "!`tCNM-070-16 is offline" }
    if (Test-Connection -ComputerName CNM-070-17 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-17\C$\kvcc } else { Write-Host "!`tCNM-070-17 is offline" }
    if (Test-Connection -ComputerName CNM-070-18 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-18\C$\kvcc } else { Write-Host "!`tCNM-070-18 is offline" }
    if (Test-Connection -ComputerName CNM-070-19 -Quiet -Count 1) { Copy-Item -Path $full_path  -Destination \\CNM-070-19\C$\kvcc } else { Write-Host "!`tCNM-070-19 is offline" }

    Write-Host "Transfering to CNM-075 Animation Towers"
    if (Test-Connection -ComputerName CNM-075-01 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-01\C$\kvcc } else { Write-Host "!`tCNM-075-01 is offline" }
    if (Test-Connection -ComputerName CNM-075-02 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-02\C$\kvcc } else { Write-Host "!`tCNM-075-02 is offline" }
    if (Test-Connection -ComputerName CNM-075-03 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-03\C$\kvcc } else { Write-Host "!`tCNM-075-03 is offline" }
    if (Test-Connection -ComputerName CNM-075-04 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-04\C$\kvcc } else { Write-Host "!`tCNM-075-04 is offline" }
    if (Test-Connection -ComputerName CNM-075-05 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-05\C$\kvcc } else { Write-Host "!`tCNM-075-05 is offline" }
    if (Test-Connection -ComputerName CNM-075-06 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-06\C$\kvcc } else { Write-Host "!`tCNM-075-06 is offline" }
    if (Test-Connection -ComputerName CNM-075-07 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-07\C$\kvcc } else { Write-Host "!`tCNM-075-07 is offline" }
    if (Test-Connection -ComputerName CNM-075-08 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-08\C$\kvcc } else { Write-Host "!`tCNM-075-08 is offline" }
    if (Test-Connection -ComputerName CNM-075-09 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-09\C$\kvcc } else { Write-Host "!`tCNM-075-09 is offline" }
    if (Test-Connection -ComputerName CNM-075-10 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-10\C$\kvcc } else { Write-Host "!`tCNM-075-10 is offline" }
    if (Test-Connection -ComputerName CNM-075-11 -Quiet -Count 1) { Copy-Item -Path $full_path -Destination \\CNM-075-11\C$\kvcc } else { Write-Host "!`tCNM-075-11 is offline" }

}

<#
START YOUR CODE BELOW.
#>
$network_path_directory = "\\CNM-STF-JWIN02\C$\kvcc"


Write-Host "`nWe will now copy over the openh264 codec to the Animation Towers`n==============="
$file_name = "openh264-2.2.0-win64.dll"
$full_path = $network_path_directory + "\" + $file_name
TransferFiles($full_path)

Write-Host "`nWe will now copy over the quadro drivers to the Animation Towers`n==============="
$file_name = "quadro-new.exe"
$full_path = $network_path_directory + "\" + $file_name
TransferFiles($full_path)

Write-Host "`nWe will now copy over the saber after effects plugin to the Animation Towers`n==============="
$file_name = "saber-after-effects.exe"
$full_path = $network_path_directory + "\" + $file_name
TransferFiles($full_path)

Write-Host "`nThis Operation was a Success"

