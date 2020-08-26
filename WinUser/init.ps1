# install scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') &&

# update
scoop update &&

# add bucket
scoop bucket add extras &&

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
scoop install gettext
scoop install imagemagick

scoop install fzf
scoop install ripgrep

scoop install rust
scoop install go
# }}}

scoop cleanup *

exit 1
