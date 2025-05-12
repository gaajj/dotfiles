alias update='sudo pacman -Syu --noconfirm'
alias pac='sudo pacman -S'
alias pacc='sudo pacman -S --noconfirm'

alias kys='sudo systemctl hibernate'

alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -AF'
alias lla='ls -lAF'
alias l='ls -F'

alias grep='grep --color=auto'

alias mkdir='mkdir -p -v'
alias rmdir='rmdir -v'
mkcd() {
  case $# in
  1)
    mkdir -p "$1"
    cd "$1"
    ;;
  *)
    echo "USAGE : mkcd <rep>"
    ;;
  esac
}

alias c='cd ..'
alias ping='ping -c3'
alias tmux='tmux -2'

alias backupcheck='sudo du -sh /backup/rsnapshot/* | sort'

alias ff='fastfetch'

alias gs='git status --short'
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'

alias ga='git add'
alias ga='git commit'

alias gp='git push'
alias gu='git pull'

alias gl='git log --all --graph --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n"'
alias gb='git branch'

alias gi='git init'
alias gcl='git clone'
