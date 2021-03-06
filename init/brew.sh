 set -eu

# Install brew from net if not exists.
{
  if [[ -x $(which brew 2>&1) ]]; then
    echo "brew is available."
  else
    echo "brew not found."
    echo "Install brew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # if [[ -x $(which ruby 2>&1) ]]; then
    #   if [[ "${OSTYPE}" =~ ^darwin ]]; then
    #     xcode-select --install
    #     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    #   elif [[ "${OSTYPE}" =~ ^linux ]]; then
    #     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    #   fi
    # else
    #   echo ruby not found.
    #   exit 1
    # fi
  fi
} &&

# Upgrade installed formulae.
brew upgrade

# bash
brew install bash

# zsh
brew install zsh
brew install zplug

# if [[ "${OSTYPE}" =~ ^darwin ]]; then
#   sudo echo /usr/local/bin/zsh >> /etc/shell
#   chsh -s /usr/local/bin/zsh
# fi &&

# Install GNU core utilities
brew install coreutils

# get more
brew install binutils
brew install findutils
brew install moreutils
brew install inetutils

# gcc
brew install gcc

# String packages.
brew install gettext
brew install nkf
brew install libyaml

# Utils
# iconv
brew install libiconv

# rsync
brew install rsync

brew install colordiff
brew install rename
brew install watch
brew install xz
brew install tidy-html5
brew install tree
brew install git
brew install autoconf
brew install automake
brew install libtool
# brew install ncurses
brew install pinfo
brew install zip
brew install gnutls
brew install gmp  
brew install unzip
brew install htop
brew install pkg-config
brew install zlib
brew install libksba
brew install libgpg-error

# qrcode
brew install qrencode

# identify or delete duplicate files
brew install fdupes

# Free lossless audio codec
brew install flac

# regexp
brew install oniguruma

# fun
# brew install figlet
# brew install cowsay

# Install wget, curl
brew install curl
brew install wget

# Install some image packages.
brew install imagemagick
brew install pngcheck
brew install jpeg
brew install libpng
brew install libtiff
brew install exiftool

# nokogiri needs this.
brew install libxml2
brew install libxslt

# dart-sass
brew install dart
brew install sass/sass/sass

# db
brew install sqlite
brew install postgresql

# webserver
brew install nginx

# json parser
brew install jq

# ctags
brew install ctags

# fzf
brew install fzf

# rg
brew install ripgrep
brew install rga
# rga dependencies
brew install pandoc
brew install poppler 
brew install tesseract

# alternative to find
brew install fd

# Movie package.
brew install ffmpeg

# yq
brew install yq

# openssl
brew install openssh
brew install openssl@1.1

# qrcode
brew install zbar

# nodebrew
brew install nodebrew

# Program languages.
brew install python
# brew install lua
# brew install luarocks
brew install ruby
brew install perl
# brew cask install julia
# brew install rust
brew install go

# Go dependency management tool
# brew install dep

# go static sites generator
brew install hugo

# vim
brew install vim --HEAD

# Install something depends on deference platform.
if [[ "${OSTYPE}" =~ ^darwin ]]; then
  # macos only.
  :;
elif [[ "${OSTYPE}" =~ ^linux ]]; then
  # linux only
  brew install util-linux
  brew install screen
fi

# cleaning up
brew cleanup

exit 0