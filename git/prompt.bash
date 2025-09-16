if [ ! "$(type -t __git_ps1)" == 'function' ]; then
  gitprompt=''

  case "$(bash -c 'source /etc/os-release && echo "${ID}"')"
    in 'fedora' )
      gitprompt='/usr/share/git-core/contrib/completion/git-prompt.sh'
      ;;
  esac

  test -r "${gitprompt}" && source "${gitprompt}"
  unset gitprompt
fi

if type -t __git_ps1 &>/dev/null; then
  export PS1="${PS1/'\e[0m\]\n$ '/'\e[1;35m$(__git_ps1)\e[0m\]\n$ '}"
fi
