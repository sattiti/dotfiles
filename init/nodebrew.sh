set -eu

# Install nodebrew from net if not exists.
{
  if ! [[ -x $(which nodebrew 2>&1) ]]; then
    curl -L git.io/nodebrew | perl - setup
  fi
} &&

# Upgrade nodebrew
nodebrew selfupdate

# Install the latest version of node.
nodebrew install-binary latest

# use the latest version.
nodebrew use latest

# cleaning up all.
nodebrew clean all

# npm upgrade.
npm -g upgrade

# Install coffee
npm -g install coffee-script
npm -g install colors
npm -g install eslint
npm -g install fs-extra
npm -g install htmlhint
npm -g install jshint
npm -g install mocha
npm -g install uglify-js
npm -g install typescript

exit 0
