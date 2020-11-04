Write-Host "$(Get-Date) INFO: Installing IIS..."
    Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools
    Remove-Website -Name 'Default Web Site'  
    Remove-WebAppPool *
    Write-Host "$(Get-Date) INFO: Downloading Visual C++ Redistributable 2017..."
    Invoke-WebRequest -Uri 'https://stglobanetautomation.blob.core.windows.net/common/VC_redist.x64_2017.exe' `
     -OutFile 'VC_redist.x64_2017.exe' -UseBasicParsing
    Write-Host "$(Get-Date) INFO: Installing Visual C++ Redistributable 2017..."
    ./VC_redist.x64_2017.exe /install /passive /norestart
