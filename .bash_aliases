alias update='sudo pacman -Syu --noconfirm'
alias pac='sudo pacman -Sy'
alias pacc='sudo pacman -Sy --noconfirm'

alias kys='shutdown -h now'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
