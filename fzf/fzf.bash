if command -v fzf &>/dev/null; then
  if fzf --bash &>/dev/null; then
    eval "$(fzf --bash)"
  elif [ -r '/usr/share/doc/fzf/examples/key-bindings.bash' ]; then
    source '/usr/share/doc/fzf/examples/key-bindings.bash'
  fi
fi

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#31353a \
  --color=bg:#131518 \
  --color=border:#45A9F9 \
  --color=fg:#c4cad1 \
  --color=gutter:#131518 \
  --color=header:#FFCC95 \
  --color=hl+:#45A9F9 \
  --color=hl:#45A9F9 \
  --color=info:#676B79 \
  --color=marker:#FF9AC1 \
  --color=pointer:#FF9AC1 \
  --color=prompt:#45A9F9 \
  --color=query:#c4cad1:regular \
  --color=scrollbar:#45A9F9 \
  --color=separator:#FFCC95 \
  --color=spinner:#FF9AC1 \
"
