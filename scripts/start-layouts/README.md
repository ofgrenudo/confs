# Start Layouts

## Creating a new Layout

1. On a build PC configure your new layout.
2. run the ```Export-StartLayout``` command.
3. Modify the StartLayout file and change the `pinnedList` to `primaryOEMPins`
4. Copy the JSON file to C:\Users\Default\AppData\Local\Microsof\Windows\Shell

Alternatively, windows holds an encrypted version of the startup file in the `%LocalAppData%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState` folder. Copying the start.bin file to whatever computers same folder, will essentially do the same thing.


