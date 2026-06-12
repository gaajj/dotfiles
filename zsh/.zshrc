# tmux
if [ -z "$TMUX" ]; then
    tmux attach 2>/dev/null || tmux new-session -s main
fi

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# prompt
autoload -U promptinit; promptinit
prompt pure

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

# completion — only rebuild cache once per day
autoload -U compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# options
setopt autocd
setopt correct
setopt no_beep

# zoxide
eval "$(zoxide init zsh)"

# aliases
alias ls='eza --icons --group-directories-first'
alias l='eza -l --icons --group-directories-first --git --no-user --no-time --no-permissions --no-filesize'
alias la='eza -la --icons --group-directories-first --git --no-user --no-time --no-permissions --no-filesize'
alias ll='eza -l --icons --group-directories-first --git'
alias lla='eza -la --icons --group-directories-first --git'
alias lt='eza --tree --icons --group-directories-first'

alias n='nvim'

# keybinds
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# sdkman (java) — lazy loaded on first use
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
    unfunction sdk
    [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
    export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
    export PATH="$JAVA_HOME/bin:$PATH"
    sdk "$@"
}

# path
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$SDKMAN_DIR/candidates/java/current/bin:$PATH"
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share
export PATH="$HOME/.cargo/bin:$PATH"
