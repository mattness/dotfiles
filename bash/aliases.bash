alias reload='source ${HOME}/.bashrc'
alias ls='ls --color=auto'
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

mkcd() {
  mkdir -p "$@"
  cd "$_"
}

hist() {
  history | grep -v hist | grep "$@"
}
