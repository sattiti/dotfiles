set -eu

# Install brew from net if not exists.
{
  if [[ -x $(which brew 2>&1) ]]; then
    echo "brew is available."
  else
    echo "brew not found."
    if [[ -x $(which ruby 2>&1) ]]; then
      if [[ "${OSTYPE}" =~ ^darwin ]]; then
        xcode-select --install &&
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

# Install GNU core utilities
brew install coreutils

# get more
brew install binutils
brew install findutils
brew install moreutils

# Utils
brew install colordiff
brew install pinfo
brew install rename
brew install watch
brew install xz
brew install tidy-html5

# Install wget, curl
brew install curl
brew install wget

# Install some image packages.
brew install imagemagick
brew install pngcheck
brew install jpeg
brew install libpng
brew install libtiff

# String packages.
brew install gettext
brew install nkf
brew install libyaml

# nokogiri needs this.
brew install libxml2
brew install libxslt

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
# brew install openssl@1.1

# Program languages.
brew install python3
brew install lua

# vim
brew install vim --with-custom-ruby --with-gettext --with-lua --with-python3

# Install something depends on deference platform.
if [[ "${OSTYPE}" =~ ^darwin ]]; then
  # macos only.
  # Movie packages.
  brew install ffmpeg
elif [[ "${OSTYPE}" =~ ^linux ]]; then
  # linux only
  brew install zip
  brew install unzip
  brew install util-linux
fi

# cleaning up
brew cleanup

exit 0
