My dotfiles
===========

For stuff to work, must be cloned to `~/dot` with the `--recurse-submodules`
option.

Then run `~/dot/install.sh`, which just symlinks some dotfiles into `~`.

Everything `install.sh` does is idempotent, so you can safely run it more than
once, or re-run it later if something new is added.


Dependencies
------------

Generally, the dotfiles will gracefully handle the absence of these
dependencies, but make use of them if they are present.

Install with OS package manager:
  - emacs

Install with pip:
  - virtualenv
  - virtualenvwrapper
  - flake8

Install with npm/yarn:
  - eslint

Install via Homebrew (on OS X):
  - python
  - python3
  - hub
