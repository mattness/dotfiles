completion=/usr/share/git/completion/git-completion.bash
gitprompt=/usr/share/git/completion/git-prompt.sh

[[ -f $completion ]] && . $completion
[[ -f $gitprompt ]] && . $gitprompt

unset completion
unset gitprompt
