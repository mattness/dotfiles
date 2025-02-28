alias reload='source $HOME/.bashrc'
alias ll='ls -lh'
alias lla='ls -alh'
alias la='ls -a'
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -h'
alias diff='diff -u'
alias cdiff='colordiff -u'
alias patch='patch -u'
alias tree='tree -I bin -I obj'

mkcd() {
  mkdir -p "$*"
  cd "$*"
}

hist() {
  history | grep -v hist | grep "$@"
}
