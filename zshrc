# load local zshrc
[[ -s "$HOME/.shells/zshrc" ]] && source "$HOME/.shells/zshrc"

# load zplug
[[ -s "$HOME/.shells/zplugrc" ]] && source "$HOME/.shells/zplugrc"

# load common shellrc
[[ -s "$HOME/.shells/shellrc" ]] && source "$HOME/.shells/shellrc"

# load fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh