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
        Clear-Host
        $this.log("System Information....", "Green", "Black", $true)
        Start-Sleep -Seconds 2
        $info = Get-ComputerInfo
        foreach ($prop in $info.PSObject.Properties) {
            if ($null -ne $prop.Value -and $prop.Value -ne "") {
                $this.log($prop.Name, "Green", "Black", $false)
                $this.log(".........", "White", "Black", $false)
                $this.log("$($prop.Value)", "Yellow", "Black", $true)
                Start-Sleep -Seconds 0.5
            }
        }
    }
}
class Main{
    [SystemInfo] $sysInfo
    [string]$title0
    [string]$title1
    [string]$title2
    [string]$title3
    [string]$title4
    [string]$margin
    [int]$mainChoice = 0
    Main(){
        Clear-Host
        $this.sysInfo = [SystemInfo]::new()
        $this.margin = "-------------------------------------------------"
        $this.title0= "### ### ###### ###    ###### ###### ####### "
        $this.title1= "### ### #      ###    ### ## #      ##   ## "
        $this.title2= "####### ###### ###    ###### ###### ####### "
        $this.title3= "### ### #      ###    ###    #      ### ## "
        $this.title4= "### ### ###### ###### ###    ###### ###  ## TOOL"
    }
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
    [void] printTitle(){
        $this.log("test", "Green", "Black", $true)
        $this.log($this.margin, "Green", "Green", $true)
        $this.log($this.title0, "DarkGray", "Black", $true)
        $this.log($this.title1, "DarkGray", "Black", $true)
        $this.log($this.title2, "DarkGray", "Black", $true)
        $this.log($this.title3, "DarkGray", "Black", $true)
        $this.log($this.title4, "DarkGray", "Black", $true)
        $this.log($this.margin, "Green", "Green", $true)
    }
    [void] printMainOptions(){
        $this.log("[1] - ", "Green", "Black", $false)
        $this.log("System info", "White", "Black", $true)
        $this.log("[2] - ", "Green", "Black", $false)
        $this.log("Network tools", "White", "Black", $true)
        $this.log("[3] - ", "Green", "Black", $false)
        $this.log("Disk tools", "White", "Black", $true)
        $this.log("[4] - ", "Green", "Black", $false)
        $this.log("Memory tools", "White", "Black", $true)
    }
    [void] getMainChoice(){
        while ($true) {
            $input = Read-Host "Enter a number (1-4)"
            [int]$choice = 0
            if ([int]::TryParse($input, [ref]$choice) -and $choice -ge 1 -and $choice -le 4) {
                $this.mainChoice = $choice
                $this.log("Selected: $choice", "Green", "Black", $true)
                break
            }
            $this.log("Invalid choice! Please enter 1-4.", "Red", "Black", $true)
            Start-Sleep -Milliseconds 1500
            Clear-Host
            $this.printTitle()
            $this.printMainOptions()
        }
    }
    [void] processMainChoice(){
        switch ($this.mainChoice){
            1 { $this.sysInfo.PrintComputerInfoColored()}
        }
    }
}
$main = [Main]::new()
$main.printTitle()
$main.printMainOptions();
$main.getMainChoice();
$main.processMainChoice();