$host.UI.RawUI.WindowTitle = "Starting WinWiFiPassMan..."
Add-Type -Name Window -Namespace Console -MemberDefinition '[DllImport("Kernel32.dll")]public static extern IntPtr GetConsoleWindow();[DllImport("user32.dll")]public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
[void][Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)
Start-Process powershell -ArgumentList "Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/ImMALWARE/WinWiFiPassMan/ee48e11138aa5a73e6529ca7f68f318628f0cfe5/WinWiFiPassMan.ps1 | Invoke-Expression" -Verb RunAs