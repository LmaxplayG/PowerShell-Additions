<#
.SYNTAX
Build-Project
.DESCRIPTION
Builds the current project (using Make or a build.ps1 file)
.OUTPUTS
System.Null
#>
function Build-Project () {
    if ( Get-Item -Path "./build.ps1" -Force -ErrorAction SilentlyContinue ) {
        ./build.ps1
        return
    } elseif ( Get-Item -Path "./*.csproj" ) {
        dotnet build
    } elseif ( Get-Item -Path "./makefile" -Force -ErrorAction SilentlyContinue ) {
        make
        return
    } else {
        Write-Host -NoNewline -ForegroundColor "Red" "Unable to find a project to build`n"
    }
}