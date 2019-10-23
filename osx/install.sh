#!/bin/sh

if [ ! -f "$HOME/dot/osx/install.sh" ]; then
  echo "must be cloned at ~/dot/"
  exit 1
fi

for fn in bash_profile zshrc; do
  src="$HOME/dot/osx/${fn}"
  dest="$HOME/.${fn}"
  if [ -e $dest ]; then
    echo "skipping $fn; already exists in homedir"
  else
    echo "linking $fn"
    ln -s $src $dest
  fi
done

