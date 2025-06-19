Stop-Service spooler -Force
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Connections" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Printers" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Providers" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\V4 Connections" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Print\Connections" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Print\Printers" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Print\Providers" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Print\V4 Connections" -Recurse
Remove-Item -Path "HKCU:\Printers" -Recurse
Remove-Item -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\PrinterPorts" -Recurse
Remove-Item -Path "Registry::HKEY_USERS\.DEFAULT\Printers" -Recurse

.\PsExec.exe /accepteula
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\SWD\PRINTENUM" -Recurse
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceClasses\{0ecef634-6ef0-472a-8085-5ad023ecbccd}" -Recurse
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\ControlSet001\Enum\SWD\PRINTENUM" -Recurse -ErrorAction SilentlyContinue
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\ControlSet001\Control\DeviceClasses\{0ecef634-6ef0-472a-8085-5ad023ecbccd}" -Recurse -ErrorAction SilentlyContinue
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\ControlSet002\Enum\SWD\PRINTENUM" -Recurse -ErrorAction SilentlyContinue
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\ControlSet002\Control\DeviceClasses\{0ecef634-6ef0-472a-8085-5ad023ecbccd}" -Recurse -ErrorAction SilentlyContinue
.\PsExec.exe powershell Remove-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{1ed2bbf9-11f0-4084-b21f-ad83a8e6dcdc}" -Recurse 

Restart-Computer -Force
