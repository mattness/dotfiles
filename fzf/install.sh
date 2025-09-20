#!/usr/bin/env bash

if ! command -v fzf &>/dev/null; then
  arch="$(uname -m)"
  case "${arch}" in
    'aarch64' )
      arch='arm64'
      ;;

    'x86_64' )
      arch='amd64'
      ;;

    * )
      # Unknown architecture
      unset arch
      ;;
  esac

  if [ ! -z "${arch}" ]; then
    mkdir -p "${HOME}/.local/bin"
    url="$(curl -sL https://api.github.com/repos/junegunn/fzf/releases/latest | jq -r '.assets[] | select(.name | match("'"fzf-.*-linux_${arch}.tar.gz"'")) | .browser_download_url')"
    curl -fsSL "${url}" | tar -C "${HOME}/.local/bin" -zx
  fi
fi
