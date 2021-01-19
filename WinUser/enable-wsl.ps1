# Enable subsystem
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Enable virtualMachine feature
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# you may have to reboot
Restart-Computer

# set default wsl version to wsl2
wsl.exe --set-default-version 2


# install some linux distribution from the appstore
# Download some pkg
Invoke-WebRequest -Uri https://aka.ms/wsl-debian-gnulinux -OutFile $env:USERPROFILE\Downloads\Debian.appx -UseBasicParsing

# Add-Package
Add-AppxPackage $env:USERPROFILE\Downloads\Debian.appx


# Uninstall Package
# Get-AppxPackage *debian* | Remove-AppxPackage -AllUsers -tConfirm