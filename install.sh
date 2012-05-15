#!/bin/sh

if [ ! -f "$HOME/dot/install.sh" ]; then
  echo "must be cloned at ~/dot/"
  exit 1
fi

for fn in gitconfig screenrc emacs.d hgrc; do
  src="$HOME/dot/${fn}"
  dest="$HOME/.${fn}"
  if [ -e $dest ]; then
    echo "skipping $fn; already exists in homedir"
  else
    echo "linking $fn"
    ln -s $src $dest
  fi
done

if grep -q ". ~/dot/bash_custom" "$HOME/.bashrc"; then
  echo "skipping source of bash_custom; already in ~/.bashrc"
else
  echo "Adding source of ~/dot/bash_custom to ~/.bashrc"
  cat >> "$HOME/.bashrc" <<EOF
if [ -f ~/dot/bash_custom ]; then
	. ~/dot/bash_custom
fi
EOF
fi
