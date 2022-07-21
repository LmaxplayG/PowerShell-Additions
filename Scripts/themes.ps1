#region Commands

<#
    .SYNOPSIS
    Sets the theme

    .DESCRIPTION
    Sets the theme to the input Theme

    .PARAMETER Theme
    The theme's name

    .PARAMETER Silent
    If set to true it won't print a message
    
    .EXAMPLE
    Set-Theme THEME_DEFAULT
    
    .EXAMPLE
    Set-Theme THEME_MONOCHROME
#>
function Set-Theme {
    param (
        # Make $Theme the name of a function
        [Parameter(Mandatory=$true)]
        [String] $Theme,
        [Boolean] $Silent = $false
    )
    $global:THEME = $Theme
    if(!$Silent) {
        Write-Host "Theme set to $global:THEME succesfully" -ForegroundColor Green
    }
}

<#
    .SYNOPSIS
    Sets the theme to the default theme

    .DESCRIPTION
    Sets the theme to the default theme

    .PARAMETER Silent
    If set to true it won't print a message
#>
function Reset-Theme {
    param (
        [Boolean] $Silent = $false
    )
    $global:THEME = "THEME_DEFAULT"
    if(!$Silent) {
    Write-Host "Theme reset to $global:THEME succesfully" -ForegroundColor Green
    }
}

#endregion Commands

#region Themes

function THEME_DEFAULT {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor Green;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_DEFAULT_GIT {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor "Green";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;

    $branch = (Get-GitBranch)

    if($null -ne $branch) {
        Write-Host -NoNewline ( "" + ($branch) + " " ) -ForegroundColor Red
    }

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline -ForegroundColor:White ">";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_DEFAULT_NO_PS {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_DEFAULT_NL_NO_PS {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline -ForegroundColor:White "`n>";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_DEFAULT_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor Green;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_DEFAULT_GIT_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor "Green";
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Green;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor Blue;

    $branch = (Get-GitBranch)

    if($null -ne $branch) {
        Write-Host -NoNewline ( "" + ($branch) + " " ) -ForegroundColor Red
    }

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }

    Write-Host -NoNewline -ForegroundColor:White "`n>";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_MONOCHROME {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -ForegroundColor White -NoNewline "PS ";
    Write-Host -ForegroundColor White -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString());
    Write-Host -ForegroundColor White -NoNewline " ";
    Write-Host -ForegroundColor White -NoNewline ($CmdPromptUser.ToString() + " ");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -ForegroundColor White -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"");
    } else {
        Write-Host -ForegroundColor White -NoNewline $CmdPromptCurrentFolder.ToString();
    }
    Write-Host -ForegroundColor White -NoNewline ">";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'White'
        Keyword            = 'White'
        Comment            = 'White'
        Command            = 'White'
        Number             = 'White'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'White'
        Variable           = 'White'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'White'
    }
    $Host.PrivateData.ErrorForegroundColor = 'White'

    return " ";
}

function THEME_MONOCHROME_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -ForegroundColor White -NoNewline "PS ";
    Write-Host -ForegroundColor White -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString());
    Write-Host -ForegroundColor White -NoNewline " ";
    Write-Host -ForegroundColor White -NoNewline ($CmdPromptUser.ToString() + " ");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -ForegroundColor White -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"");
    } else {
        Write-Host -ForegroundColor White -NoNewline $CmdPromptCurrentFolder.ToString();
    }
    Write-Host -ForegroundColor White -NoNewline "`n>";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'White'
        Keyword            = 'White'
        Comment            = 'White'
        Command            = 'White'
        Number             = 'White'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'White'
        Variable           = 'White'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'White'
    }
    $Host.PrivateData.ErrorForegroundColor = 'White'

    return " ";
}

function THEME_MAGENTA {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor DarkMagenta;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkMagenta;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkMagenta;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Magenta'
        Error              = 'Magenta'
        Keyword            = 'DarkMagenta'
        Comment            = 'DarkMagenta'
        Command            = 'DarkMagenta'
        Number             = 'DarkMagenta'
        Member             = 'DarkMagenta'
        Operator           = 'Magenta'
        Type               = 'DarkMagenta'
        Variable           = 'DarkMagenta'
        Parameter          = 'Magenta'
        ContinuationPrompt = 'Magenta'
        Default            = 'Magenta'
        String             = 'DarkMagenta'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Magenta'

    return " ";
}

function THEME_MAGENTA_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor DarkMagenta;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkMagenta;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkMagenta;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Magenta'
        Error              = 'Magenta'
        Keyword            = 'DarkMagenta'
        Comment            = 'DarkMagenta'
        Command            = 'DarkMagenta'
        Number             = 'DarkMagenta'
        Member             = 'DarkMagenta'
        Operator           = 'Magenta'
        Type               = 'DarkMagenta'
        Variable           = 'DarkMagenta'
        Parameter          = 'Magenta'
        ContinuationPrompt = 'Magenta'
        Default            = 'Magenta'
        String             = 'DarkMagenta'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Magenta'

    return " ";
}

function THEME_MAGENTA_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Magenta'
        Error              = 'Magenta'
        Keyword            = 'DarkMagenta'
        Comment            = 'DarkMagenta'
        Command            = 'DarkMagenta'
        Number             = 'DarkMagenta'
        Member             = 'DarkMagenta'
        Operator           = 'Magenta'
        Type               = 'DarkMagenta'
        Variable           = 'DarkMagenta'
        Parameter          = 'Magenta'
        ContinuationPrompt = 'Magenta'
        Default            = 'Magenta'
        String             = 'DarkMagenta'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Magenta'

    return " ";
}

function THEME_MAGENTA_NL_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Magenta;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Magenta;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Magenta'
        Error              = 'Magenta'
        Keyword            = 'DarkMagenta'
        Comment            = 'DarkMagenta'
        Command            = 'DarkMagenta'
        Number             = 'DarkMagenta'
        Member             = 'DarkMagenta'
        Operator           = 'Magenta'
        Type               = 'DarkMagenta'
        Variable           = 'DarkMagenta'
        Parameter          = 'Magenta'
        ContinuationPrompt = 'Magenta'
        Default            = 'Magenta'
        String             = 'DarkMagenta'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Magenta'

    return " ";
}

function THEME_RED {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor DarkRed;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkRed;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkRed;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Red;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Red;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Red'
        Error              = 'Red'
        Keyword            = 'DarkRed'
        Comment            = 'DarkRed'
        Command            = 'DarkRed'
        Number             = 'DarkRed'
        Member             = 'DarkRed'
        Operator           = 'Red'
        Type               = 'DarkRed'
        Variable           = 'DarkRed'
        Parameter          = 'Red'
        ContinuationPrompt = 'Red'
        Default            = 'Red'
        String             = 'DarkRed'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_RED_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor DarkRed;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkRed;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkRed;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Red;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Red;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Red'
        Error              = 'Red'
        Keyword            = 'DarkRed'
        Comment            = 'DarkRed'
        Command            = 'DarkRed'
        Number             = 'DarkRed'
        Member             = 'DarkRed'
        Operator           = 'Red'
        Type               = 'DarkRed'
        Variable           = 'DarkRed'
        Parameter          = 'Red'
        ContinuationPrompt = 'Red'
        Default            = 'Red'
        String             = 'DarkRed'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_RED_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Red;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Red;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Red'
        Error              = 'Red'
        Keyword            = 'DarkRed'
        Comment            = 'DarkRed'
        Command            = 'DarkRed'
        Number             = 'DarkRed'
        Member             = 'DarkRed'
        Operator           = 'Red'
        Type               = 'DarkRed'
        Variable           = 'DarkRed'
        Parameter          = 'Red'
        ContinuationPrompt = 'Red'
        Default            = 'Red'
        String             = 'DarkRed'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_RED_NL_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Red;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Red;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Red'
        Error              = 'Red'
        Keyword            = 'DarkRed'
        Comment            = 'DarkRed'
        Command            = 'DarkRed'
        Number             = 'DarkRed'
        Member             = 'DarkRed'
        Operator           = 'Red'
        Type               = 'DarkRed'
        Variable           = 'DarkRed'
        Parameter          = 'Red'
        ContinuationPrompt = 'Red'
        Default            = 'Red'
        String             = 'DarkRed'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_GREEN {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor DarkGreen;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkGreen;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkGreen;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Green'
        Error              = 'Green'
        Keyword            = 'DarkGreen'
        Comment            = 'DarkGreen'
        Command            = 'DarkGreen'
        Number             = 'DarkGreen'
        Member             = 'DarkGreen'
        Operator           = 'Green'
        Type               = 'DarkGreen'
        Variable           = 'DarkGreen'
        Parameter          = 'Green'
        ContinuationPrompt = 'Green'
        Default            = 'Green'
        String             = 'DarkGreen'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Green'

    return " ";
}
function THEME_GREEN_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor DarkGreen;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor DarkGreen;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkGreen;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Green'
        Error              = 'Green'
        Keyword            = 'DarkGreen'
        Comment            = 'DarkGreen'
        Command            = 'DarkGreen'
        Number             = 'DarkGreen'
        Member             = 'DarkGreen'
        Operator           = 'Green'
        Type               = 'DarkGreen'
        Variable           = 'DarkGreen'
        Parameter          = 'Green'
        ContinuationPrompt = 'Green'
        Default            = 'Green'
        String             = 'DarkGreen'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Green'

    return " ";
}

function THEME_GREEN_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Green'
        Error              = 'Green'
        Keyword            = 'DarkGreen'
        Comment            = 'DarkGreen'
        Command            = 'DarkGreen'
        Number             = 'DarkGreen'
        Member             = 'DarkGreen'
        Operator           = 'Green'
        Type               = 'DarkGreen'
        Variable           = 'DarkGreen'
        Parameter          = 'Green'
        ContinuationPrompt = 'Green'
        Default            = 'Green'
        String             = 'DarkGreen'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Green'

    return " ";
}

function THEME_GREEN_NL_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'Green'
        Error              = 'Green'
        Keyword            = 'DarkGreen'
        Comment            = 'DarkGreen'
        Command            = 'DarkGreen'
        Number             = 'DarkGreen'
        Member             = 'DarkGreen'
        Operator           = 'Green'
        Type               = 'DarkGreen'
        Variable           = 'DarkGreen'
        Parameter          = 'Green'
        ContinuationPrompt = 'Green'
        Default            = 'Green'
        String             = 'DarkGreen'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Green'

    return " ";
}

function THEME_BLUE {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor Blue;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Blue;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkCyan;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Cyan;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Cyan;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'DarkCyan'
        Error              = 'DarkCyan'
        Keyword            = 'Blue'
        Comment            = 'Blue'
        Command            = 'Cyan'
        Number             = 'Blue'
        Member             = 'Blue'
        Operator           = 'DarkCyan'
        Type               = 'Blue'
        Variable           = 'Blue'
        Parameter          = 'DarkCyan'
        ContinuationPrompt = 'DarkCyan'
        Default            = 'DarkCyan'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'DarkCyan'

    return " ";
}

function THEME_BLUE_NL {
    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline "PS " -ForegroundColor Blue;
    Write-Host -NoNewline ($PSVersionTable.PSVersion.Major.ToString() + "." + $PSVersionTable.PSVersion.Minor.ToString()) -ForegroundColor Blue;
    Write-Host -NoNewline " ";
    Write-Host -NoNewline ($CmdPromptUser.ToString() + " ") -ForegroundColor DarkCyan;
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Cyan;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Cyan;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'DarkCyan'
        Error              = 'DarkCyan'
        Keyword            = 'Blue'
        Comment            = 'Blue'
        Command            = 'Cyan'
        Number             = 'Blue'
        Member             = 'Blue'
        Operator           = 'DarkCyan'
        Type               = 'Blue'
        Variable           = 'Blue'
        Parameter          = 'DarkCyan'
        ContinuationPrompt = 'DarkCyan'
        Default            = 'DarkCyan'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'DarkCyan'

    return " ";
}

function THEME_BLUE_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Cyan;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Cyan;
    }
    Write-Host -NoNewline ">" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'DarkCyan'
        Error              = 'DarkCyan'
        Keyword            = 'Blue'
        Comment            = 'Blue'
        Command            = 'Cyan'
        Number             = 'Blue'
        Member             = 'Blue'
        Operator           = 'DarkCyan'
        Type               = 'Blue'
        Variable           = 'Blue'
        Parameter          = 'DarkCyan'
        ContinuationPrompt = 'DarkCyan'
        Default            = 'DarkCyan'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'DarkCyan'

    return " ";
}
function THEME_BLUE_NL_NO_PS {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");
    
    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Cyan;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Cyan;
    }
    Write-Host -NoNewline "`n>" -ForegroundColor White;

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'DarkCyan'
        Error              = 'DarkCyan'
        Keyword            = 'Blue'
        Comment            = 'Blue'
        Command            = 'Cyan'
        Number             = 'Blue'
        Member             = 'Blue'
        Operator           = 'DarkCyan'
        Type               = 'Blue'
        Variable           = 'Blue'
        Parameter          = 'DarkCyan'
        ContinuationPrompt = 'DarkCyan'
        Default            = 'DarkCyan'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'DarkCyan'

    return " ";
}


function THEME_MINI {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline -ForegroundColor:White ">";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_MINI_NL {
    if($IsWindows) {
        #$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
    } elseif ($IsLinux) {
        #$CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    if("$CmdPromptCurrentFolder".Contains(" ")) {
        Write-Host -NoNewline ("`"" + $CmdPromptCurrentFolder.ToString() + "`"") -ForegroundColor Green;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Green;
    }
    Write-Host -NoNewline -ForegroundColor:White "`n>";

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return " ";
}

function THEME_PSDEFAULT {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return "PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_NL {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    return "PS $($executionContext.SessionState.Path.CurrentLocation)$("`n>" * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_COLOR {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    Write-Host -NoNewline "PS $($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor Cyan
    return "$('>' * ($nestedPromptLevel + 1)) ";
}

function THEME_PSDEFAULT_COLOR_NL {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    Write-Host -NoNewline "PS $($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor Cyan
    return "$("`n>" * ($nestedPromptLevel + 1)) ";
}

function THEME_CMD {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'White'
        Keyword            = 'White'
        Comment            = 'White'
        Command            = 'White'
        Number             = 'White'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'White'
        Variable           = 'White'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'White'
    }
    $Host.PrivateData.ErrorForegroundColor = 'White'

    Write-Host -NoNewline "$($executionContext.SessionState.Path.CurrentLocation)" -ForegroundColor White
    Write-Host -NoNewline "$('>' * ($nestedPromptLevel + 1))" -ForegroundColor White
    return " ";
}

function THEME_BASH {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [System.Net.Dns]::GetHostName();
        #$CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Green;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Green;

    Write-Host -NoNewline ":" -ForegroundColor White;

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~") -ForegroundColor Blue;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Blue;
    }

    Write-Host -NoNewline -ForegroundColor:White "$";
    return " ";
}

function THEME_BASH_NL {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [System.Net.Dns]::GetHostName();
        #$CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -NoNewline ($CmdPromptUser.ToString() + "@") -ForegroundColor Green;
    
    Write-Host -NoNewline ($CmdPromptPC.ToString()) -ForegroundColor Green;

    Write-Host -NoNewline ":" -ForegroundColor White;

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~") -ForegroundColor Blue;
    } else {
        Write-Host -NoNewline $CmdPromptCurrentFolder.ToString() -ForegroundColor Blue;
    }

    Write-Host -NoNewline -ForegroundColor:White "`n$";
    return " ";
}

function THEME_BASH_MONOCHROME {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'White'
        Keyword            = 'White'
        Comment            = 'White'
        Command            = 'White'
        Number             = 'White'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'White'
        Variable           = 'White'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'White'
    }
    $Host.PrivateData.ErrorForegroundColor = 'White'

    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [System.Net.Dns]::GetHostName();
        #$CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -ForegroundColor White -NoNewline ($CmdPromptUser.ToString() + "@");
    
    Write-Host -ForegroundColor White -NoNewline ($CmdPromptPC.ToString());

    Write-Host -ForegroundColor White -NoNewline ":";

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -ForegroundColor White -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~");
    } else {
        Write-Host -ForegroundColor White -NoNewline $CmdPromptCurrentFolder.ToString();
    }

    Write-Host -ForegroundColor White -NoNewline -ForegroundColor:White "$";
    return " ";
}

function THEME_BASH_MONOCHROME_NL {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'White'
        Keyword            = 'White'
        Comment            = 'White'
        Command            = 'White'
        Number             = 'White'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'White'
        Variable           = 'White'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'White'
    }
    $Host.PrivateData.ErrorForegroundColor = 'White'

    if($IsWindows) {
        $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[1];
        $CmdPromptPC = [System.Net.Dns]::GetHostName();
        #$CmdPromptPC = [Security.Principal.WindowsIdentity]::GetCurrent().Name.Split("\")[0];
    } elseif ($IsLinux) {
        $CmdPromptUser = whoami;
    }
    $CmdPromptCurrentFolder = $executionContext.SessionState.Path.CurrentLocation.ToString().Replace("Microsoft.PowerShell.Core\FileSystem::", "");

    Write-Host -ForegroundColor White -NoNewline ($CmdPromptUser.ToString() + "@");
    
    Write-Host -ForegroundColor White -NoNewline ($CmdPromptPC.ToString());

    Write-Host -ForegroundColor White -NoNewline ":";

    if((Get-Location).Path.StartsWith($env:USERPROFILE)) {
        Write-Host -ForegroundColor White -NoNewline $CmdPromptCurrentFolder.ToString().Replace($env:USERPROFILE, "~");
    } else {
        Write-Host -ForegroundColor White -NoNewline $CmdPromptCurrentFolder.ToString();
    }

    Write-Host -ForegroundColor White -NoNewline -ForegroundColor:White "`n$";
    return " ";
}

function THEME_ARROW {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    Write-Host -NoNewline -ForegroundColor:Yellow "➜";
    return " ";
}

function THEME_LINEBOSS {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    # Available characters
    # 
    # 
    # 
    # 
    # 
    # 
    # 
    # 
    # 

    $UserName = [System.Environment]::UserName
    #$MachineName = [System.Environment]::MachineName

    $Path = $pwd.ToString()

    $Seperator = ""
    #$Seperator = ""
    
    # Make path only the last 2 directories
    $Path = $Path.split('\')
    if($Path.Length -gt 2) {
        $Part1 = $Path[$Path.Length -2]
        $Part2 = $Path[$Path.Length -1]
        # Make each part max 10 characters, if it exeeds this, `...` is appended
        $MaxLength = 32
        if($Part1.Length -gt $MaxLength) {
            $Part1 = $Part1.Substring(0, $MaxLength) + "..."
        }
        if($Part2.Length -gt $MaxLength) {
            $Part2 = $Part2.Substring(0, $MaxLength) + "..."
        }
        $Path = $Part1 + "/" + $Part2
    } elseif ($Path.Length -gt 1) {
        $Path = $Path[$Path.Length -1]
    } else {
        $Path = $Path[0]
    }

    $Path = $Path.Replace('\', '/')
    if($Path.StartsWith($pwd.ToString().Split("\")[3])) {
        $Path = $Path.Substring($pwd.ToString().Split("\")[3].Length)
    }

    # Get the current drive
    $Drive = $pwd.ToString().Split('\')[0]

    if($Drive.EndsWith(":")) {
        $Drive = $Drive.Replace(":", "")
    }

    if ($Drive -eq "Microsoft.PowerShell.Core") {
        # we are on an UNC path, so make the drive letter UNC
        $Drive = "UNC (" + $pwd.ToString().Split("\")[3] + ")"
    }
    
    # Username
    Write-Host -NoNewline $Seperator -BackgroundColor Blue -ForegroundColor Black
    Write-Host -NoNewline " $UserName " -BackgroundColor Blue -ForegroundColor Black
    Write-Host -NoNewline $Seperator -ForegroundColor Blue

    # Machine name
    # Write-Host -NoNewline $Seperator -BackgroundColor Blue -ForegroundColor Black
    # Write-Host -NoNewline " $MachineName " -BackgroundColor Blue -ForegroundColor Black
    # Write-Host -NoNewline $Seperator -ForegroundColor Blue

    # Drive letter
    Write-Host -NoNewline $Seperator -BackgroundColor Green -ForegroundColor Black
    Write-Host -NoNewline " $Drive " -BackgroundColor Green -ForegroundColor Black
    Write-Host -NoNewline $Seperator -ForegroundColor Green

    # Path
    Write-Host -NoNewline $Seperator -BackgroundColor Red -ForegroundColor Black
    Write-Host -NoNewline " $Path " -BackgroundColor Red -ForegroundColor Black
    Write-Host -NoNewline $Seperator -ForegroundColor Red

    $branch = Get-GitBranch
    if ($null -ne $branch) {
        Write-Host -NoNewline $Seperator -BackgroundColor Cyan -ForegroundColor Black
        Write-Host -NoNewline " $branch " -BackgroundColor Cyan -ForegroundColor Black
        Write-Host -NoNewline $Seperator -ForegroundColor Cyan    
    }
    Write-Host -NoNewline "`n$" -BackgroundColor Black -ForegroundColor Yellow
    return " "
}
function THEME_LINEBOSS_ICONS {

    Set-PSReadLineOption -Colors @{
        Emphasis           = 'White'
        Error              = 'Red'
        Keyword            = 'Green'
        Comment            = 'DarkGray'
        Command            = 'Yellow'
        Number             = 'Blue'
        Member             = 'White'
        Operator           = 'White'
        Type               = 'DarkGreen'
        Variable           = 'Green'
        Parameter          = 'White'
        ContinuationPrompt = 'White'
        Default            = 'White'
        String             = 'Blue'
    }
    $Host.PrivateData.ErrorForegroundColor = 'Red'

    # Available characters
    # 
    # 
    # 
    # 
    # 
    # 
    #  
    # 
    # 

    $UserName = [System.Environment]::UserName
    #$MachineName = [System.Environment]::MachineName

    $Path = $pwd.ToString()

    $Seperator = ""
    #$Seperator = ""

    $PathIcon = ""
    # If the current directory has no content, use , else use 
    $directoryInfo = Get-ChildItem -Path "./" | Measure-Object
    if ($directoryInfo.Count -eq 0) {
        $PathIcon = ""
    } elseif ($null -ne (Get-GitBranch)) {
        $PathIcon = ""
    } else {
        $PathIcon = ""
    }
    Write-Host
    
    # Make path only the last 2 directories
    $Path = $Path.split('\')
    if($Path.Length -gt 2) {
        $Part1 = $Path[$Path.Length -2]
        $Part2 = $Path[$Path.Length -1]
        # Make each part max 10 characters, if it exeeds this, `...` is appended
        $MaxLength = 32
        if($Part1.Length -gt $MaxLength) {
            $Part1 = $Part1.Substring(0, $MaxLength) + "..."
        }
        if($Part2.Length -gt $MaxLength) {
            $Part2 = $Part2.Substring(0, $MaxLength) + "..."
        }
        $Path = $Part1 + "/" + $Part2
    } elseif ($Path.Length -gt 1) {
        $Path = $Path[$Path.Length -1]
    } else {
        $Path = $Path[0]
    }

    $Path = $Path.Replace('\', '/')
    if($Path.StartsWith($pwd.ToString().Split("\")[3])) {
        $Path = $Path.Substring($pwd.ToString().Split("\")[3].Length)
    }

    # Get the current drive
    $Drive = $pwd.ToString().Split('\')[0]
    # If it ends with a ":" it's a drive letter

    if($Drive.EndsWith(":")) {
        $Drive = $Drive.Replace(":", "")
    }

    if ($Drive -eq "Microsoft.PowerShell.Core") {
        # we are on an UNC path, so make the drive letter UNC
        $Drive = "UNC (" + $pwd.ToString().Split("\")[3] + ")"
    }

    # Username
    Write-Host -NoNewline $Seperator -BackgroundColor Blue -ForegroundColor Black
    Write-Host -NoNewline " $UserName " -BackgroundColor Blue -ForegroundColor Black
    Write-Host -NoNewline $Seperator -ForegroundColor Blue

    # Machine name
    # Write-Host -NoNewline $Seperator -BackgroundColor Blue -ForegroundColor Black
    # Write-Host -NoNewline " $MachineName " -BackgroundColor Blue -ForegroundColor Black
    # Write-Host -NoNewline $Seperator -ForegroundColor Blue

    # Drive letter
    Write-Host -NoNewline $Seperator -BackgroundColor Green -ForegroundColor Black
    Write-Host -NoNewline " $Drive " -BackgroundColor Green -ForegroundColor Black
    Write-Host -NoNewline $Seperator -ForegroundColor Green

    # Path
    Write-Host -NoNewline $Seperator -BackgroundColor Red -ForegroundColor Black
    Write-Host -NoNewline " $PathIcon$Path " -BackgroundColor Red -ForegroundColor Black
    Write-Host -NoNewline $Seperator -ForegroundColor Red

    $branch = Get-GitBranch
    if ($null -ne $branch) {
        Write-Host -NoNewline $Seperator -BackgroundColor Cyan -ForegroundColor Black
        Write-Host -NoNewline " $branch " -BackgroundColor Cyan -ForegroundColor Black
        Write-Host -NoNewline $Seperator -ForegroundColor Cyan    
    }
    Write-Host -NoNewline "`n$" -BackgroundColor Black -ForegroundColor Yellow
    return " "
}

#endregion Themes