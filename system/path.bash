path_dirs=(
  "${dotfilesdir}/bin"
  "${HOME}/.local/bin"
)

for d in "${path_dirs[@]}"; do
  if ! _dir_is_in_path "${d}"; then
    export PATH="${d}:${PATH}"
  fi
done

unset path_dirs
