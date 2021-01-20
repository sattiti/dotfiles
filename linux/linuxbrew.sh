# Install the Homebrew dependencies {{{
sudo apt-get install build-essential git file curl
# }}}

# set path {{{
# /home/linuxbrew/.linuxbrew/bin
# /home/linuxbrew/.linuxbrew/sbin
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
# echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
# }}}

# We recommend that you install GCC {{{
brew install gcc
# }}}