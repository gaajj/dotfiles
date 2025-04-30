alias update='sudo pacman -Syu --noconfirm'
alias pac='sudo pacman -S'
alias pacc='sudo pacman -S --noconfirm'

alias kys='shutdown -h now'

alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -AF'
alias lla='ls -lAF'
alias l='ls -F'

alias grep='grep --color=auto'

alias mkdir='mkdir -p -v'
alias rmdir='rmdir -v'
mkcd()
{
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
