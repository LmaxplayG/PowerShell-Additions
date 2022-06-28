$opath = (Get-Item .).FullName
Set-Location $env:TEMP
mkdir -Path __TMP__ -Force
Set-Location "__TMP__"
git clone "https://github.com/Lmaxplay/PowerShell-Additions"
Set-Location "PowerShell-Additions"
./install.ps1
Set-Location -Path $opath