orig_umask=$(umask)
umask 0077
mkdir -p ~/.ssh/config.d/fragments
touch ~/.ssh/authorized_keys
umask ${orig_umask}
unset orig_umask

curl -fssL https://api.github.com/meta | jq -r '.ssh_keys[] | "github.com " + .' >> ~/.ssh/known_hosts
