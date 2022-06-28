try {
if($PSVersionTable.PSVersion.Major -le 5) {
    Write-Host -NoNewline "PowerShell 5 and below are not supported" -ForegroundColor Red
}

if($IsWindows) {
    New-Item -ItemType Directory "C:\Users\Lmaxplay\Documents\PowerShell\" -Force -ErrorAction SilentlyContinue > $null
    Copy-Item -Path "./profile.ps1" -Destination ($env:UserProfile + "\Documents\PowerShell\Microsoft.Powershell_profile.ps1")
    New-Item -ItemType Directory "C:\Users\Lmaxplay\Documents\PowerShell\Scripts\" -Force -ErrorAction SilentlyContinue > $null
    Copy-Item -Recurse -Path ".\Scripts\*" -Destination ($env:UserProfile + "\Documents\PowerShell\Scripts\") -Force
    #Copy-Item -Path "./profile.ps1" -Destination ($env:UserProfile + "\Documents\PowerShell\Microsoft.VSCode_profile.ps1") # ? Was disabled since ( PowerShell Integrated Console ) is better without the addons
    Write-Host "Installed succesfully, please restart PowerShell" -ForegroundColor Cyan
} elseif ($IsLinux) {
    Write-Host "Sorry, but this script is not supported on Linux" -ForegroundColor Red
} elseif ($IsMacOS) {
    Write-Host "Sorry, but this script is not supported on MacOS" -ForegroundColor Red
} else {
    Write-Host "Sorry, but this script is not supported on your OS" -ForegroundColor Red
}
exit 0
} catch {
    Write-Host "Something went wrong, please try again, if this keeps happening, make an issue on https://github.com/Lmaxplay/PowerShell-Additions" -ForegroundColor Red
    exit 1
}
