#!/usr/bin/env bash

# Make sure neovim is installed. We'll use the latest appimage for distros whose package managers are out-of-date
if ! command -v nvim &>/dev/null || [ '--force' == "${1}" ]; then
  arch="$(uname -m)"
  case "${arch}" in
    'aarch64' )
      arch='arm64'
      ;;

    'x86_64' )
      ;;

    * )
      # Unknown architecture
      unset arch
      ;;
  esac

  if [ ! -z "${arch}" ]; then
    mkdir -p "${HOME}/.local/bin"
    url="$(curl -sL https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets[] | select(.name == "'"nvim-linux-${arch}.appimage"'") | .browser_download_url')"
    curl -fsSLo "${HOME}/.local/bin/nvim" "${url}" && chmod 755 "${HOME}/.local/bin/nvim"
  fi
fi

if command -v nvim &>/dev/null; then
  repourl='ssh://git@github.com/mattness/neovim-conf.git'
  configdir="${HOME}/.config/nvim"
  mkdir -p "$(dirname "${configdir}")"

  if [ ! -d "${configdir}" ] || ! git -C "${configdir}" rev-parse --git-dir &>/dev/null || [ ! "$(git -C "${configdir}" remote get-url origin)" == "${repourl}" ]; then
    [ -d "${configdir}" ] && mv "${configdir}"{,.bak}
    git clone ssh://git@github.com/mattness/neovim-conf.git "${configdir}"
  fi
fi
