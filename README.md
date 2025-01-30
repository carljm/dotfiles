My dotfiles
===========

For stuff to work, must be cloned to `~/dot` with the `--recurse-submodules`
option.

Then run `~/dot/install.sh`, which just symlinks some dotfiles into `~`.

Everything `install.sh` does is idempotent, so you can safely run it more than
once, or re-run it later if something new is added.

For the spaceship prompt theme to work, on your local machine (not on remote
servers), run `./install.sh` inside `powerline-fonts/` submodule and set your
terminal to use one of the Powerline fonts. (Or download and install Fira Code
and set that as terminal font.)

The vim config relies on Vundle being cloned at `~/.vundle/Vundle.vim` (note
this is not the default shown in the Vundle docs.) E.g. `git clone
https://github.com/VundleVim/Vundle.vim.git ~/.vundle/Vundle.vim`, then after
installing the dotfiles, run `:PluginInstall` in vim.

To get the right terminal colors in iTerm2, go to Settings | Profiles | Colors
| Color Presets and import
"base16-iterm2/itermcolors/base16-darkmoss.itermcolors", then select it
from the list.


Dependencies
------------

Generally, the dotfiles will gracefully handle the absence of these
dependencies, but make use of them if they are present.

Install with OS package manager / Homebrew:
  - emacs
  - vim
  - neovim
  - fzf
  - gpg
  - gh
  - rg

Install via their install script
  - nvm
  - uv

Install with npm/yarn:
  - eslint

Install Rust toolchain from rustup.rs
