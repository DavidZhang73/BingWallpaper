$ErrorActionPreference = 'Stop'

if ($Host.Version.Major -ge 3) {
    Register-ScheduledTask BingWallpaper DavidZhang (
        New-ScheduledTaskAction wscript BingWallpaper.vbs %ALLUSERSPROFILE%
    ) (
        New-ScheduledTaskTrigger -Daily -At 0:0z
    ) (
        New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -RunOnlyIfNetworkAvailable -StartWhenAvailable
    ) -Force | Out-Null
}
else {
    $Xml = "$env:TMP\BingWallpaper.xml"
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072;
    (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/DavidZhang73/BingWallpaper/main/BingWallpaper.xml', $Xml)
    schtasks /Create /XML $Xml /TN '\DavidZhang\BingWallpaper' /F
    Remove-Item $Xml -Force
}

@'
CreateObject("WScript.Shell").Run "powershell -NoProfile -NonInteractive ""[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor 3072; (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/DavidZhang73/BingWallpaper/main/wallup.ps1') | iex""",0
'@ > "$env:ALLUSERSPROFILE\BingWallpaper.vbs"

schtasks /Run /TN '\DavidZhang\BingWallpaper'
