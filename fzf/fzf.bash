if command -v fzf &>/dev/null; then
  if fzf --bash &>/dev/null; then
    eval "$(fzf --bash)"
  elif [ -r '/usr/share/doc/fzf/examples/key-bindings.bash' ]; then
    source '/usr/share/doc/fzf/examples/key-bindings.bash'
  fi
fi
