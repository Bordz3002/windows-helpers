class Debug{
    Debug(){}
    [void] showInitialScreen(){
        Write-Host "git: https://github.com/Bordz3002/windows-helpers.git" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "             Windows Helper Tool                     " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "A (powershell) terminal based tool for debugging     " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "performance issues, system optimization and etc      " -BackgroundColor Green -ForegroundColor Black;
    }
    [void] showInitialChoice(){
        Write-Host "";
        Write-Host "Actions:                                             " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "1: System Information                                " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "E: Exit                                              " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "Enter Choice:                                        " -BackgroundColor Green -ForegroundColor Black;
    }
    [string] getKeyPressed(){
        $keyInfo=[System.Console]::ReadKey($true);
        return $keyInfo.key.ToString();
    }
    [void] showCpuInfo(){
        $cpu=Get-CimInstance Win32_Processor;
        $cpuArchitecture="";
        $isAskingToGoBack=$true;
        switch($cpu.Architecture){
            0{$cpuArchitecture="x86"}
            9{$cpuArchitecture="x64"}
            5{$cpuArchitecture="ARM"}
            default{$cpuArchitecture="Unknown"}   
        }
        while($isAskingToGoBack){
            $pressedKey=$this.getKeyPressed();
            Write-Host "key pressed: $($pressedKey)";
            switch($pressedKey){
                "E"{
                    Write-Host "Action: Going Back                                 " -BackgroundColor Yellow -Foreground Black;
                    Start-Sleep -Milliseconds 250;
                    Clear-Host;
                    return;
                }
                default{
                    Write-Host "Invalid Action:                                      " -BackgroundColor Red -ForegroundColor Black;
                    Start-Sleep -Milliseconds 250; 
                    Clear-Host;
                    $this.showInitialScreen();
                    Write-Host "";
                    Write-Host "System Information > Cpu Information                 " -BackgroundColor Green -ForegroundColor Black;
                    Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForeGroundColor Black;
                    Write-Host "Name: $($cpu.Name)" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Cores: $($cpu.NumberOfCores)" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Manufacturer: $($cpu.Manufacturer)" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Architecture: $cpuArchitecture" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Threads: $($cpu.NumberOfLogicalProcessors)" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Max Clock Speed: $($cpu.MaxClockSpeed)mhz" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Load Percentage: $($cpu.LoadPercentage)%" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Description: $($cpu.Description)" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "Status: $($cpu.Status   )" -BackgroundColor Yellow -ForegroundColor Black;
                    Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForeGroundColor Black;
                    Write-Host "";
                    Write-Host "Action:                                              " -BackgroundColor Green -ForegroundColor Black;
                    Write-Host "E. Go Back                                           " -BackgroundColor Green -ForegroundColor Black;
                    Write-Host "";
                }
            }
        }
    }
    [void] showGpuInformation(){
        Clear-Host;
        $this.showInitialScreen();
        $isAskingToGoBack=$true;
        $gpu=Get-CimInstance Win32_VideoController;
        Write-Host "";
        Write-Host "System Information > Gpu Information                " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "Name: $($gpu.Name)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Processor: $($gpu.Processor)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Description: $($gpu.Description)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Resolution: $($gpu.Resolution)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Status: $($gpu.Status)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Threads: $($gpu.Threads)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Availability: $($gpu.Availability)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Architecture: $($gpu.Architecture)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "Manufacturer: $($gpu.Manufacturer)" -BackgroundColor Yellow -ForegroundColor Black;
        Write-Host "----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "";
        Write-Host "Actions:                                            " -BackgroundColor Green -ForeGroundColor Black;
        Write-Host "E: Go Back                                          " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "";
        while($isAskingToGoBack){
            $pressedKey=$this.getKeyPressed();
            Write-Host "Action: $($pressedKey)                                           "-BackgroundColor Green -ForeGroundColor Black;
            switch($pressedKey){
                "E"{
                    Write-Host "Action: Going Back...                               "-BackgroundColor Yellow -ForegroundColor Black;
                }
            }
        }
    }
    [void] showSystemInfo(){
        $isAskingSystemInfoChoice=$true;
        Clear-Host;
        $this.showInitialScreen();
        Write-Host "";
        Write-Host "System Information                                   " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "1. Cpu Information                                   " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "2. Gpu Information                                   " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "3. Ram Information                                   " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "4. Disk Information                                  " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "5. Network Information                               " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "6. Software Information                              " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "E: Go Back                                           " -BackgroundColor Green -ForegroundColor Black;
        Write-Host "-----------------------------------------------------" -BackgroundColor Green -ForegroundColor Black;
        Write-Host "Enter Choice:                                        " -BackgroundColor Green -ForegroundColor Black;
        while($isAskingSystemInfoChoice){
            $pressedKey=$this.getKeyPressed();
            switch($pressedKey){
                "D1"{
                    Write-Host "Action: $pressedKey                                  " -BackgroundColor Yellow -ForegroundColor Black;
                    $this.showCpuInfo();
                    $isAskingSystemInfoChoice=$false;
                }
                "D2"{
                    Write-Host "Action: $pressedKey                                  " -BackgroundColor Yellow -ForegroundColor Black;
                    $this.showGpuInformation();
                    
                }
            }
        }
    }
    [void] main(){
        while($true){
            Clear-Host; 
            $isAskingInitialChoice=$true;
            while($isAskingInitialChoice){
                $this.showInitialScreen();
                $this.showInitialChoice();
                $pressedKey=$this.getKeyPressed();
                switch($pressedKey){
                    "D1"{
                        Write-Host "Action: $pressedKey                                  " -BackgroundColor Yellow -ForegroundColor Black;
                        $this.showSystemInfo();
                        $isAskingInitialChoice=$false;
                    }
                    "D2"{
                        Write-Host "Action: $pressedKey                                  " -BackgroundColor Yellow -ForegroundColor Black;
                        $isAskingInitialChoice=$false;
                    }
                    "E"{
                        Write-host "Action: Exit                                         " -BackgroundColor Yellow -ForegroundColor Black;
                        Start-Sleep -Milliseconds 1000;
                        return;
                    }
                    default{
                        Write-Host "Invalid choice. Please try again...                  " -BackgroundColor Red -ForegroundColor Black;
                        Start-Sleep -Milliseconds 1000;
                        Clear-Host;
                    }
                }
            }
        }
    }
}
$debug=[Debug]::new();
$debug.main();