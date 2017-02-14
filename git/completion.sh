git_contrib_dir=${GIT_CONTRIB_DIR:-/usr/share/git/completion}
completion=${git_contrib_dir}/git-completion.bash
gitprompt=${git_contrib_dir}/git-prompt.sh

[[ -f $completion ]] && . $completion
[[ -f $gitprompt ]] && . $gitprompt

unset completion
unset gitprompt
