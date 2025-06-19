New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Print\Providers\Client Side Rendering Print Provider" -Name "RemovePrintersAtLogoff" -Value 1 -Force
Restart-Computer -Force
