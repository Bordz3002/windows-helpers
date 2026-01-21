class SystemInfo {

    [void] log(
        [string]$content,
        [string]$foregroundColor = "White",
        [string]$backgroundColor = "Black",
        [bool]$newLine = $true
    ) {
        if ($newLine) {
            Write-Host $content -ForegroundColor $foregroundColor -BackgroundColor $backgroundColor
        }
        else {
            Write-Host $content -ForegroundColor $foregroundColor -BackgroundColor $backgroundColor -NoNewline
        }
    }
    [void] PrintComputerInfoColored() {
        $info = Get-ComputerInfo
        foreach ($prop in $info.PSObject.Properties) {
            if ($null -ne $prop.Value -and $prop.Value -ne "") {
                $this.log($prop.Name, "Green", "Black", $false)
                $this.log(".........", "White", "Black", $false)
                $this.log("$($prop.Value)", "Yellow", "Black", $true)
            }
        }
    }
}
$sys = [SystemInfo]::new()
$sys.PrintComputerInfoColored()
