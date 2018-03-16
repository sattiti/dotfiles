# add vagrant box
# vagrant box add debian/jessie64 https://atlas.hashicorp.com/debian/boxes/jessie64 && vagrant plugin install vagrant-proxyconf
vagrant init debian/stretch64

# add plugin
vagrant plugin install vagrant-proxyconf
vagrant plugin install vagrant-rsync-back

# Necessary packages for install linuxbrew.
# sudo apt-get install build-essential curl file git python-setuptools ruby

# linuxbrew
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

# rvm
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# curl -sSL https://get.rvm.io | bash -s stable
