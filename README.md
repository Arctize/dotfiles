# dotfiles
Dotfiles, arranged so that they can be easily linked to their respective locations using [GNU Stow](https://www.gnu.org/software/stow/)

Some configs reference external scripts, you can find most of them in my [scripts repo](https://github.com/Arctize/scripts).

## How to
* Since stow won't modify any existing files, (re)move existing configs you want to replace
* Then, simply run `stow foo` to have all the configs in `dotfiles/foo/` symlinked
* If you think you can handle them all, just run `stow *`

## Note
* For `dotfiles/foo/bar`, a symlink `~/foo/bar` will be created. So, if the directory structure is `dotfiles/foo/.config/foo/foo.conf`,
`foo.conf` will be located in `~/.config/foo/foo.conf`. In case of `dotfiles/foo/.foo.conf`, the symlink will simply be `~/.foo.conf`.
* Be aware that, if `.config/foo` already exists, that directory will stay a normal directory and only `foo.conf` will be a symlink
into the dotfiles directory, if not however, stow will create a *symlinked* directory, so create it beforehand, if you don't
want it to be a symlink.
