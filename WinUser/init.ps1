# set execute policy
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Enable virtualMachine feature
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# install scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') &&

# add bucket
scoop bucket add extras
scoop bucket add versions

scoop update
scoop update *

# install software {{{
# common
scoop install zip
scoop install wintoolset
scoop install dark
scoop install innounp

# broswer
scoop install firefox
scoop install googlechrome

# git
scoop install git

# diff tool
scoop install winmerge

# dev
scoop install cmake
scoop install make
scoop install gettext
scoop install curl
scoop install ghostscript
scoop install imagemagick

# utils
scoop install fzf
scoop install ripgrep
scoop install fd

# lang
scoop install rust
scoop install go

# editor
scoop install vscode
scoop install vim
scoop install ruby
scoop install python
scoop install nodejs
# }}}

scoop cleanup *

exit 1