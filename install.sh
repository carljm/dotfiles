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
  read -p "Moco IRC password? " moco_irc_pw
  cp $src/config $dest
  perl -pi -e "s/<FREENODE_PW>/$freenode_irc_pw/;" $dest/config
  perl -pi -e "s/<MOZILLA_PW>/$mozilla_irc_pw/;" $dest/config
  perl -pi -e "s/<MOCO_PW>/$moco_irc_pw/;" $dest/config
  echo "  linking theme and scripts"
  ln -s $src/solarized-universal.theme $dest/solarized-universal.theme
  ln -s $src/scripts $dest/scripts
fi

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
