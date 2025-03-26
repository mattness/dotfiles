# TODO: Remap CapsLock, etc
# See:
# - https://github.com/andrasmaroy/dotfiles/commit/5815a8d137a028781a3f0cf9ccb10044301bf099
# - https://apple.stackexchange.com/questions/4813/changing-modifier-keys-from-the-command-line/277544#277544
# - https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
# - https://github.com/geerlingguy/mac-dev-playbook/issues/22

# Set up ssh and 1password integration
orig_umask=$(umask)
umask 0077
mkdir -p ~/.ssh/config.d/fragments ~/.1password ~/Library/LaunchAgents
touch ~/.ssh/authorized_keys ~/.1password/.hostmap
ln -snf "${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ~/.1password/ssh-agent.sock
umask ${orig_umask}
unset orig_umask
