# mattness does dotfiles

## dotfiles

This project was inspired by [Zach Holman](https://github.com/holman)'s
[dotfiles](https://github.com/holman/dotfiles) project, and borrows heavily
from it (both in structure and in content).  My thanks go to him and those
who influenced and inspired his project.  I considered forking his project,
but decided to roll my own in light of the fact that I would have deleted
more than I would have kept, and that I use bash instead of zsh.

## install

- `git clone git://github.com/mattness/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `./install`

The install script will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## uninstall
- `cd ~/.dotfiles`
- `./uninstall`

The uninstall script will remove any symlinks the install script created,
and restore any backups that the install script created.  Be sure to exit any
open terminal windows and restart them to clear out your environment/aliases.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.bash` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `$HOME/.dotfiles/install`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.bash**: Any files ending in `.bash` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `$HOME/.dotfiles/install`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up bash autocomplete functions.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you. That said, I do use this as *my* dotfiles, so there's a good
chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/mattness/dotfiles/issues) on this repository
and I'd love to get it fixed for you!
