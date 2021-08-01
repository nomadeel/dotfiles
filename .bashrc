#
# ~/.bashrc
#

export EDITOR="nvim"
export VISUAL="nvim"

# QT based hacks to get it use the same theme and render elements properly
export QT_QPA_PLATFORMTHEME=gtk3
export QT_AUTO_SCREEN_SCALE_FACTOR=0

export RUST_SRC_PATH="$HOME/rust/src/"

# FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
source "$HOME/.profile"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Check for an interactive session
[ -z "$PS1" ] && return

_PROMPT() {
    _EXIT_STATUS=$?
    [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
    PS1="\033[1;34m\]» \[\e[0;37m\]\h\033[1;30m\]  $_EXIT_STATUS_STR\[\033[1;32m\][\[\033[0m\]\W\[\033[1;32m\]]\[\033[1;34m\];\[\033[0m\] "
    unset _EXIT_STATUS_STR
}

#PROMPT_COMMAND=_PROMPT

# PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'

alias sel4-container='make -C $HOME/documents/sel4_dockerfiles user_camkes-riscv HOST_DIR=$(pwd)'

alias nv='nvim'

eval "$(lua $HOME/z.lua/z.lua --init bash enhanced once fzf)"

alias zz='z -c'      # restrict matches to subdirs of $PWD
alias zi='z -i'      # cd with interactive selection
alias zf='z -I'      # use fzf to select in multiple matches
alias zb='z -b'      # quickly cd to the parent directory

alias ..='cd ..'
alias pcat='pygmentize -O style=monokai'
