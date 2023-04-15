#!/bin/sh

targetdir=${1:-${HOME}/.dotfiles}
case `uname` in
  Linux)  branch=master ;;
  Darwin) branch=osx ;;
  *)       >&2 echo Unknown OS! Aborting...; exit 1 ;;
esac

NONINTERACTIVE=1 /bin/bash -c "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`" \
  && hash -r                                                                                                    \
  && git clone --branch "${branch}" --recursive https://github.com/mattness/dotfiles.git "${targetdir}"         \
  && eval "`/opt/homebrew/bin/brew shellenv`"                                                                   \
  && /opt/homebrew/bin/brew bundle install --no-lock --file <(curl -fsSL https://dotfiles.gollob.net/Brewfile)  \
  && "${targetdir}/install" <<<'B'
