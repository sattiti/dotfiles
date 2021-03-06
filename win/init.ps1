# set execute policy
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Enable virtualMachine feature
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# install scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') &&

# git
scoop install git

# add bucket
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts
scoop bucket add jp https://github.com/dooteeen/scoop-for-jp

scoop update
scoop update *

# install software {{{
# common
scoop install 7zip
scoop install wixtoolset
scoop install dark
scoop install innounp
scoop install msys2

# broswer
scoop install firefox
scoop install googlechrome

# diff tool
scoop install winmerge

# dev
scoop install cmake
scoop install make
scoop install gettext
scoop install curl
scoop install ghostscript
scoop install imagemagick
scoop install pkg-config
scoop install openssl
scoop install llvm

# utils
scoop install fzf
scoop install ripgrep
scoop install fd
scoop install yarn
scoop install yq
scoop install jq

# terminal
scoop install windows-terminal

# lang
scoop install rust
scoop install go
scoop install ruby
scoop install python39
scoop install nodejs

# server
scoop install nginx

# db
scoop install sqlite

# editor
scoop install vscode
scoop install vim

# viewer
scoop install irfanview

# ftp
scoop install winscp

# }}}

scoop cleanup *

exit 1
