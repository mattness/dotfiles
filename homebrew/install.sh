#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
script_dir="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"

# Check for Homebrew
if ! command -v brew &>/dev/null; then
    # Ask for the administrator password upfront, and keep the sudo "session"
    # alive until we're done
    printf 'Checking for `sudo` access (which may request your password)...\n' > /dev/tty
    sudo --validate
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    command -v /opt/homebrew/bin/brew &>/dev/null && eval "$(/opt/homebrew/bin/brew shellenv)"
    brew bundle --file="${script_dir}/../Brewfile"
fi

exit 0
