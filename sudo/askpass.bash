if [ ! -z "${SSH_TTY}" ] || command -v op &>/dev/null; then
  export SUDO_ASKPASS="${dotfilesdir}/sudo/sudo-op-askpass"
  alias sudo='sudo --askpass'
fi
