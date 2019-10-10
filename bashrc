# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# load local bashrc
[[ -s "$HOME/.shells/bashrc" ]] && source "$HOME/.shells/bashrc"

# Load prompt
[[ -s "$HOME/.shells/bash_prompt" ]] && source "$HOME/.shells/bash_prompt"

# load common shellrc
[[ -s "$HOME/.shells/shellrc" ]] && source "$HOME/.shells/shellrc"
