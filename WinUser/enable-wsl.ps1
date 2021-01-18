# Enable subsystem
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# 1. Enable virtualMachine feature
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# 2. you may have to reboot
Restart-Computer

# 3. set default wsl version to wsl2
wsl.exe --set-default-version 2

# 4. install some linux distribution from the appstore