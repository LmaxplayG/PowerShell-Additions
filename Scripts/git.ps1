function Get-GitBranch {
    $output = Get-Location | ForEach-Object {
        $path = $_.Path
        do {
            # Write-Host $path
            $path
            $path = Split-Path -Path $path -Parent        
        } while ($path)
    } | % {
        $headPath = "$_/.git/HEAD"
        if (Test-Path $headPath) {
            $ref = get-content $headPath -TotalCount 1        
            if ($ref.StartsWith("ref:")) {
                $ref.Substring(5).Split("/") | select -Skip 2 | Join-String -Separator "/"
            }
            else {
                $ref.Substring(0, 8)
            }
        }
    } | Select -First 1
    if ($output -eq "") {
        return $null
    }
    else {
        return $output
    }
}
