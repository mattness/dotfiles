mkdir -p ~/.config/systemd/user

for f in ${dotfilesdir}/ssh/agent-switcher.*; do
  target=${HOME}/.config/systemd/user/$(basename "${f}")
  if ! cmp --silent "${f}" "${target}"; then
    cp "${f}" "${target}"
    should_reload=true
  fi
done

if [ ! -z "${should_reload}" ]; then
  systemctl --user daemon-reload
  unset should_reload
fi

if ! systemctl --user is-enabled agent-switcher.socket | grep -q '^enabled$'; then
  systemctl --user enable agent-switcher.socket &>/dev/null
fi

if ! systemctl --user is-active --quiet agent-switcher.socket; then
  systemctl --user start agent-switcher.socket
fi

# If we're in an SSH session, set SSH_AUTH_SOCK to our resilient socket proxy
if loginctl show-session --value -p Remote "$XDG_SESSION_ID" 2>/dev/null | grep -q "^yes$"; then
  export SSH_AUTH_SOCK="${HOME}/.ssh/agent-switcher.sock"
fi
