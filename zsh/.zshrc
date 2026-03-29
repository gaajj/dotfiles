source ~/.local/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

autoload -Uz promptinit && promptinit && prompt pure

HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

eval "$(zoxide init zsh)"

[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

