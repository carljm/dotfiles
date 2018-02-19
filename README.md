My dotfiles
===========

For stuff to work, must be cloned to `~/dot`.

Then run `install.sh`, which just symlinks some files into `~` and sets up the
shell (on OS X, it symlinks `~/dot/osx/bash_profile` to `~/.bash_profile`, on
Linux it appends a bit of code to your existing `~/.bashrc` to source
`~/dot/linux/bash_linux`).

Everything `install.sh` does is idempotent, so you can safely run it more than
once, or re-run it later if something new is added.


Dependencies
------------

Generally, the dotfiles will gracefully handle the absence of these
dependencies, but make use of them if they are present.

Install with OS package manager:
  - emacs 25
  - irssi
  - screen

Install with pip:
  - virtualenv
  - virtualenvwrapper
  - flake8

Install with npm/yarn:
  - eslint

Compile (on Linux):
  - recent versions of Python in ~/pythons/, to match aliases in bash_aliases

Install via Homebrew (on OS X):
  - python
  - python3
  - hub
