#
# ~/.bashrc
#

export EDITOR="nvim"
export VISUAL="nvim"

# QT based hacks to get it use the same theme and render elements properly
export QT_QPA_PLATFORMTHEME=gtk2
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
source "$HOME/.profile"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

