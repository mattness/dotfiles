#!/usr/bin/env bash

targetdir=${1:-${HOME}/.dotfiles}
repourl=https://github.com/mattness/dotfiles
case `uname` in
  Linux)  branch=linux ;;
  Darwin) branch=osx-ng ;;
  *)       >&2 echo Unknown OS! Aborting...; exit 1 ;;
esac

# TODO(mgollob): On linux, use /etc/os-release to determine server vs desktop dotfiles?

if command -v git >/dev/null 2>&1; then
  git clone --recurse-submodules --branch "${branch}" -- "${repourl}.git" "${targetdir}"
  "${targetdir}/bootstrap"
else
  mkdir -p "${targetdir}"
  curl -fsSL "${repourl}/archive/refs/heads/${branch}.tar.gz" | tar zxf - -C "${targetdir}" --strip-components 1
  "${targetdir}/bootstrap"
  git -c init.defaultBranch="${branch}" init "${targetdir}"
  git -C "${targetdir}" remote add -f -m "${branch}" origin "${repourl}.git"
  git -C "${targetdir}" reset "origin/${branch}"
  git -C "${targetdir}" submodule update --init
fi
