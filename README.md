# Windows WiFi Password Manager
Simple tool to view all passwords of WiFi networks saved in Windows

To use, just enter the command in Windows Search/Run/Command Prompt/PowerShell/New Shortcut
```pwsh
powershell -command "iwr -useb https://raw.githubusercontent.com/ImMALWARE/WinWiFiPassMan/main/Launcher.ps1 | iex"
```
After it finishes getting passwords, it will open Notepad with table of SSIDs and passwords
