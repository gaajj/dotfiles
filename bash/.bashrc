#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

# Add scripts to path
export PATH="$HOME/scripts:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/home/gaaj/.deno/env"

# Created by `pipx` on 2026-01-19 19:19:48
export PATH="$PATH:/home/gaaj/.local/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/gaaj/.lmstudio/bin"
# End of LM Studio CLI section

