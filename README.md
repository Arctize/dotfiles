# dotfiles
Dotfiles, arranged so that they can be easily linked to their respective
locations using [GNU Stow](https://www.gnu.org/software/stow/).


## How to
Run `stow foo` to have the directory structure and configs in `dotfiles/foo/`
  symlinked into `$HOME`.

## Note
Some configs, like the ones related to bspwm, i3 and X11 in general, are
unmaintained. Actively used tools at the time of this commit include sway (with
waybar), bash and neovim.
