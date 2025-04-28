#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\033[1;32m\]\u\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\] \$ '

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

export XDG_CURRENT_DESKTOP=Hyprland

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
