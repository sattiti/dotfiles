# update/upgrade {{{
sudo apt-get update && sudo apt-get upgrade

# dist upgrade
sudo apt-get dist-upgrade

# cleanup
sudo apt-get clean
sudo apt-get autoclean
# remove package and config files
# sudo apt-get purge PKG

# remove all unused packages
sudo apt-get autoremove
# }}}

# confirm version {{{
cat /etc/debian_version
# }}}

# utilities for WSL. {{{
# https://github.com/wslutilities/wslu
sudo apt-get install gnupg2 apt-transport-https
wget -O - https://access.patrickwu.space/wslu/public.asc | sudo apt-key add -
echo "deb https://access.patrickwu.space/wslu/debian buster main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install wslu
# }}}