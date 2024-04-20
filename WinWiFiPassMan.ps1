$host.UI.RawUI.WindowTitle = "WinWiFiPassMan" 
if ($PSUICulture -eq "ru-RU") {
    $Strings = @("Все профили пользователей", "Содержимое ключа")
} else {
    $Strings = @("All User Profile", "Key Content")
}

Write-Host "Gettings WiFi passwords, please wait"
$WiFiNames = netsh wlan show profiles | Select-String $Strings[0] | ForEach-Object { $_ -replace "$($Strings[0])\s+:\s+", "" }
$WiFiPasswords = @()

foreach ($WiFi in $WiFiNames) {
    $password = (netsh wlan show profile name="$($WiFi.Trim())" key=clear) -match $Strings[1]
    $WiFiPasswords += New-Object PSObject -Property @{
        SSID = $WiFi.Trim()
        Password = & {
            param($Password)
            if ($Password) {
                $password.Trim() -replace "$($Strings[1])\s+:\s+", ""
            } else {
                "No password"
            }
        } $password
    }
}

$WiFiPasswords | Format-Table SSID, Password | Out-File -FilePath "$env:TEMP\WinWiFiPassMan.txt"
notepad "$env:TEMP\WinWiFiPassMan.txt"