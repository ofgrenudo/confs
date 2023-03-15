# Name: Tattoo
# Authors: Joshua Winters-Brown
# Description: This script tattoos the registry with deployment variables during the operating system deployment.

# Taken from the lonely administrator https://jdhitsolutions.com/blog/powershell/5816/a-powershell-input-tool/
Function Invoke-InputBox {

    [cmdletbinding(DefaultParameterSetName="plain")]
    [OutputType([system.string],ParameterSetName='plain')]
    [OutputType([system.security.securestring],ParameterSetName='secure')]

    Param(
        [Parameter(ParameterSetName="secure")]
        [Parameter(HelpMessage = "Enter the title for the input box. No more than 25 characters.",
        ParameterSetName="plain")]        

        [ValidateNotNullorEmpty()]
        [ValidateScript({$_.length -le 25})]
        [string]$Title = "User Input",

        [Parameter(ParameterSetName="secure")]        
        [Parameter(HelpMessage = "Enter a prompt. No more than 50 characters.",ParameterSetName="plain")]
        [ValidateNotNullorEmpty()]
        [ValidateScript({$_.length -le 50})]
        [string]$Prompt = "Please enter a value:",
        
        [Parameter(HelpMessage = "Use to mask the entry and return a secure string.",
        ParameterSetName="secure")]
        [switch]$AsSecureString
    )

    if ($PSEdition -eq 'Core') {
        Write-Warning "Sorry. This command will not run on PowerShell Core."
        #bail out
        Return
    }

    Add-Type -AssemblyName PresentationFramework
    Add-Type –assemblyName PresentationCore
    Add-Type –assemblyName WindowsBase

    #remove the variable because it might get cached in the ISE or VS Code
    Remove-Variable -Name myInput -Scope script -ErrorAction SilentlyContinue

    $form = New-Object System.Windows.Window
    $stack = New-object System.Windows.Controls.StackPanel

    #define what it looks like
    $form.Title = $title
    # $form.Height = 150
    # $form.Width = 350
    $form.WindowState = 'Maximized'

    $label = New-Object System.Windows.Controls.Label
    $label.Content = "    $Prompt"
    $label.HorizontalAlignment = "left"
    $stack.AddChild($label)

    if ($AsSecureString) {
        $inputbox = New-Object System.Windows.Controls.PasswordBox
    }
    else {
        $inputbox = New-Object System.Windows.Controls.TextBox
    }

    $inputbox.Width = 300
    $inputbox.HorizontalAlignment = "center"

    $stack.AddChild($inputbox)

    $space = new-object System.Windows.Controls.Label
    $space.Height = 10
    $stack.AddChild($space)

    $btn = New-Object System.Windows.Controls.Button
    $btn.Content = "_OK"

    $btn.Width = 65
    $btn.HorizontalAlignment = "center"
    $btn.VerticalAlignment = "bottom"

    #add an event handler
    $btn.Add_click( {
            if ($AsSecureString) {
                $script:myInput = $inputbox.SecurePassword
            }
            else {
                $script:myInput = $inputbox.text
            }
            $form.Close()
        })

    $stack.AddChild($btn)
    $space2 = new-object System.Windows.Controls.Label
    $space2.Height = 10
    $stack.AddChild($space2)

    $btn2 = New-Object System.Windows.Controls.Button
    $btn2.Content = "_Cancel"

    $btn2.Width = 65
    $btn2.HorizontalAlignment = "center"
    $btn2.VerticalAlignment = "bottom"

    #add an event handler
    $btn2.Add_click( {
            $form.Close()
        })

    $stack.AddChild($btn2)

    #add the stack to the form
    $form.AddChild($stack)

    #show the form
    $inputbox.Focus() | Out-Null
    $form.WindowStartupLocation = [System.Windows.WindowStartupLocation]::CenterScreen

    $form.ShowDialog() | out-null

    #write the result from the input box back to the pipeline
    $script:myInput

}

# Get Task Sequence Variables
$ts_env = New-Object -COMObject Microsoft.SMS.TSEnvironment

# All of our information will live within this Registry Folder :)
$full_registry_key_name = "HKLM:\SOFTWARE\KVCC"

# Create the new Registry Key Location
New-Item -Path $full_registry_key_name -type Directory -Force -ErrorAction SilentlyContinue

# Get Values to Tattoo
$install_date = Get-Date -Format Get
$task_sequence_name = $ts_env.Value("_SMSTSPackageName")
$task_sequence_id = $ts_env.Value("_SMSTSPackageID")
$asset_tag = Invoke-InputBox -Title "Asset Tag Information" -Prompt "Please Enter a Asset Tag:"
$device_name = $env:computername

# Time Stamp Logic
$osd_start_time = $ts_env.Value("OSDStartTime")
$osd_time_frame = New-TimeSpan -start $osd_start_time -end $install_date
$ost_time_took = "{0:hh}:{0:mm}:{0:ss}" -f $osd_time_frame

# Write Values to Registry
New-ItemProperty $full_registry_key_name -Name "Installed Date" -Value $install_date -Type STRING -Froce -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed Name" -Value $task_sequence_name -Type STRING -Froce -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Task Sequence Deployed ID" -Value $task_sequence_id -Type STRING -Froce -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Asset Tag" -Value $asset_tag -Type STRING -Froce -ErrorAction SilentlyContinue | Out-Null
New-ItemProperty $full_registry_key_name -Name "Device Name" -Value $device_name -Type STRING -Froce -ErrorAction SilentlyContinue | Out-Null