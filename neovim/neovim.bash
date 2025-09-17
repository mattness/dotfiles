if command -v nvim &>/dev/null; then
  export MANPAGER='nvim +Man!'
  export EDITOR='nvim'
  alias vim='nvim'
fi
