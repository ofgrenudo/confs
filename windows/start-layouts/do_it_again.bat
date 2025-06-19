@echo off
powershell.exe Invoke-Command -scriptblock {"Export-StartLayout -Path LayoutModifications.json"}
cmd /c copy %LocalAppdata%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start.bin start.bin /y
cmd /c copy %LocalAppdata%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin start.bin /y
cls
Echo Remember to Update pinnedList to primaryOEMPins
pause