set -eu

# Install brew from net if not exists.
{
  if [[ -x $(which brew 2>&1) ]]; then
    echo "brew is available."
  else
    echo "brew not found."
    if [[ -x $(which ruby 2>&1) ]]; then
      if [[ "${OSTYPE}" =~ ^darwin ]]; then
        xcode-select --install
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      elif [[ "${OSTYPE}" =~ ^linux ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
      fi
    else
      echo ruby not found.
      exit 1
    fi
  fi
} &&

# Upgrade installed formulae.
brew upgrade

# bash
brew install bash
if [[ "${OSTYPE}" =~ ^darwin ]]; then
  sudo echo /usr/local/bin/bash >> /etc/shell
  chsh -s /usr/local/bin/bash
fi

# Install GNU core utilities
brew install coreutils

# get more
brew install binutils
brew install findutils
brew install moreutils

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
brew install ncurses
brew install pinfo
brew install zip
brew install unzip

# regexp
brew install oniguruma

# fun
brew install figlet
brew install cowsay

# Install wget, curl
brew install curl
brew install wget

# Install some image packages.
brew install imagemagick
brew install pngcheck
brew install jpeg
brew install libpng
brew install libtiff

# nokogiri needs this.
brew install libxml2
brew install libxslt

# sass
brew install libsass

# db
brew install sqlite
brew install postgresql

# webserver
brew install nginx

# json parser
brew install jq

# ctags
brew install ctags

# openssl
brew install openssl
brew install openssl@1.1

# qrcode
brew install zbar

# Program languages.
brew install python
brew install lua
brew install ruby
brew cask install julia

# Go lang
brew install go

# Go dependency management tool
brew install dep

# go static sites generator
brew install hugo

# vim
brew install vim --with-gettext --with-lua --with-luajit

# Install something depends on deference platform.
if [[ "${OSTYPE}" =~ ^darwin ]]; then
  # macos only.
  # Movie packages.
  brew install ffmpeg
elif [[ "${OSTYPE}" =~ ^linux ]]; then
  # linux only
  brew install util-linux
fi

# cleaning up
brew cleanup

exit 0
