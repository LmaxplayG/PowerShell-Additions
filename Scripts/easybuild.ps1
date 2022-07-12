<#
.SYNTAX
Build-Project
.DESCRIPTION
Builds the current project (using Make or a build.ps1 file)
.OUTPUTS
System.Null
#>
function Build-Project () {
    if ( Test-Path -Path "./build.ps1" -ErrorAction SilentlyContinue )
    {
        ./build.ps1
    }
    elseif ( Test-Path -Path "./makefile" -ErrorAction SilentlyContinue )
    {
        if (Get-Command "make" -ErrorAction SilentlyContinue) {
        make
        } else {
            Write-Output -NoNewline -ForegroundColor: "Red" "MVN wasn't found on path"
        }
    }
    elseif ( Test-Path -Path "./gradlew" -ErrorAction SilentlyContinue )
    {
        gradlew build
    }
    elseif ( Test-Path -Path "./pom.xml" -ErrorAction SilentlyContinue )
    {
        if (Get-Command "mvn" -ErrorAction SilentlyContinue) {
            mvn "clean"
        } else {
            Write-Output -NoNewline -ForegroundColor: "Red" "MVN wasn't found on path"
        }
    }
    elseif ( Test-Path -Path "./*.csproj" -ErrorAction SilentlyContinue )
    {
        if (Get-Command "dotnet" -ErrorAction SilentlyContinue) {
        dotnet build
        } else {
            Write-Output -NoNewline -ForegroundColor: "Red" "DOTNET wasn't found on path"
        }
    }
    else
    {
        Write-Host -NoNewline -ForegroundColor "Red" "Unable to find a project to build`n"
    }
}