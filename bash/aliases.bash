alias reload='source $HOME/.bashrc'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias lla='ls -alh'
alias la='ls -a'
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -h'
alias ndiff='`which diff` --normal'
alias diff='diff -u'
alias cdiff='colordiff -u'
alias npatch='`which patch` --normal'
alias patch='patch -u'

pidlist() {
  ps -eo pid,cmd | grep "$1" | grep -v grep | awk '{ print $1 }' | tr '\n' ',' | sed 's/.$//'
}

mkcd() {
  mkdir -p "$*"
  cd "$*"
}
