# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load the rvm script.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Load those dotfiles.
for file in $HOME/.bash/{exports,aliases,prompt}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [[ "${OSTYPE}" =~ ^darwin ]]; then
  exportLocalPath=$HOME/.bash/macos
elif [[ "${OSTYPE}" =~ ^linux ]]; then
  exportLocalPath=$HOME/.bash/linux
elif [[ "${OSTYPE}" =~ ^cygwin ]]; then
  exportLocalPath=$HOME/.bash/cygwin
fi

for file in $(echo $exportLocalPath/{exports,aliases,prompt,local}); do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file;
unset exportLocalPath

# run software updater script.
if [[ "${OSTYPE}" =~ ^(darwin|linux) ]]; then
  $HOME/.bash/bin/softwareupdater
fi

# Remove duplicate path.
if [[ -x $(which ruby 2>&1) ]]; then
  export PATH=$(echo ${PATH} | tr ':' '\n' | xargs ruby -e "puts ARGV.uniq.join(':')")
fi
