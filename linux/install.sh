#!/bin/sh

if [ ! -f "$HOME/dot/linux/install.sh" ]; then
  echo "must be cloned at ~/dot/"
  exit 1
fi

src="$HOME/dot/irssi"
dest="$HOME/.irssi"
if [ -e $dest ]; then
  echo "skipping irssi; already exists in homedir"
else
  echo "creating ~/.irssi"
  mkdir -p $dest
  echo "  copying irssi/config and substituting passwords"
  read -p "FreeNode IRC password? " freenode_irc_pw
  read -p "Mozilla IRC password? " mozilla_irc_pw
  cp $src/config $dest
  perl -pi -e "s/{{ freenode_irc_pw }}/$freenode_irc_pw/;" $dest/config
  perl -pi -e "s/{{ mozilla_irc_pw }}/$mozilla_irc_pw/;" $dest/config
  echo "  linking theme and scripts"
  ln -s $src/solarized-universal.theme $dest/solarized-universal.theme
  ln -s $src/scripts $dest/scripts
fi

if grep -q ". ~/dot/linux/bash_linux" "$HOME/.bashrc"; then
  echo "skipping source of bash_linux; already in ~/.bashrc"
else
  echo "Adding source of ~/dot/linux/bash_linux to ~/.bashrc"
  cat >> "$HOME/.bashrc" <<EOF
if [ -f ~/dot/linux/bash_linux ]; then
	. ~/dot/linux/bash_linux
fi
EOF
fi
