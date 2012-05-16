My dotfiles
===========

For stuff to work, must be cloned to `~/dot`.

Then run `install.sh`, which just symlinks some files into `~` and appends a
bit of code to your existing `~/.bashrc` to source
`~/dot/bash_custom`. Everything `install.sh` does is idempotent, so you can
safely run it more than once, or re-run it later if something new is added.


Dependencies
------------

Generally, the dotfiles will gracefully handle the absence of these
dependencies, but make use of them if they are present.

Install with OS package manager:
  - emacs
  - pymacs

Install with pip:
  - pycompletion
  - virtualenv
  - virtualenvwrapper
  - rope
  - ropemode
  - ropemacs

Compile:
  - recent versions of Python in /opt, to match aliases in bash_aliases
