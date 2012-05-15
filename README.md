My dotfiles
===========

For stuff to work, must be cloned to `~/dot`.

Then run `install.sh`, which just symlinks some files into `~`.

Dependencies
------------

Generally, the dotfiles will gracefully handle the absence of these
dependencies, but sets them up / uses them if they are present.

Install with OS package manager:
  - emacs
  - pymacs

Install with pip:
  - pycompletion
  - virtualenv
  - virtualenvwrapper
  - rope
  - ropemode
  - ropemacs (https://bitbucket.org/agr/ropemacs/)

Compile:
  - recent versions of Python in /opt, to match aliases in bash_aliases
