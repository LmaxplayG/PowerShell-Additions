<#
.SYNTAX
Build-Project
.DESCRIPTION
Builds the current project (using Make or a build.ps1 file)
.OUTPUTS
System.Null
#>
function Build-Project () {
    if ( Test-Path -Path "./build.ps1" -ErrorAction SilentlyContinue ) {
        ./build.ps1
    } elseif ( Test-Path -Path "./makefile" -ErrorAction SilentlyContinue ) {
        make
    } elseif ( Test-Path -Path "./gradlew" -ErrorAction SilentlyContinue ) {
        gradlew build
    } elseif ( Test-Path -Path "./*.csproj" -ErrorAction SilentlyContinue ) {
        dotnet build
    } else {
        Write-Host -NoNewline -ForegroundColor "Red" "Unable to find a project to build`n"
    }
}