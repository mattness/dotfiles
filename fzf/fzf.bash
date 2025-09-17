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
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"
