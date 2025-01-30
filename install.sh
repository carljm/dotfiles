#!/bin/sh

if [ ! -f "$HOME/dot/install.sh" ]; then
  echo "must be cloned at ~/dot/"
  exit 1
fi

UNAME=$(uname)

if [[ "$UNAME" == "Darwin" ]]; then
  echo "Detected OS X"
  source $HOME/dot/osx/install.sh
else
  echo "Detected Linux"
  source $HOME/dot/linux/install.sh
fi

for fn in gitconfig screenrc emacs.d hgrc vimrc vim zshrc zlogin zprofile zpreztorc zshenv lldbinit; do
  src="$HOME/dot/${fn}"
  dest="$HOME/.${fn}"
  if [ -e $dest ]; then
    echo "skipping $fn; already exists in homedir"
  else
    echo "linking $fn"
    ln -s $src $dest
  fi
done

src="$HOME/dot/nvim"
dest="$HOME/.config/nvim"
if [ -e $dest ]; then
    echo "skipping nvim; already exists in .config/nvim"
else
    echo "linking nvim"
    ln -s $src $dest
fi
