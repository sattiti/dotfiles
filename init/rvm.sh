set -eu

RVM_BIN=$HOME/.rvm/bin
RB_VER=2.4.2

curl -sSL https://get.rvm.io | bash -s stable

$RVM_BIN/rvm reload
$RVM_BIN/rvm get latest
$RVM_BIN/rvm get head
$RVM_BIN/rvm install ruby-$RB_VER
$RVM_BIN/rvm reload
$RVM_BIN/rvm --default use $RB_VER

unset RVM_BIN
unset RB_VER
