HISTSIZE=10000
HISTCONTROL=ignoreboth
HISTFILE=$HOME/.bash_history
HISTIGNORE='ls:bg:fg:history'

shopt -s histappend
shopt -s cmdhist
export HISTSIZE HISTCONTROL HISTFILE HISTIGNORE
