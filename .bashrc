#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source ~/.git-prompt.sh
export PS1="\W\$(__git_ps1)>"

export "MICRO_TRUECOLOR=1"
source ~/.local/share/blesh/ble.sh
export PATH=$PATH:/home/$USER/.spicetify
export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"
