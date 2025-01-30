#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

path=($HOME/bin $HOME/.local/bin $path)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/dot/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dot/prezto/init.zsh"
fi

path=($HOME/dot/bin /usr/local/go/bin $HOME/go/bin $path)

UNAME=$(uname)
if [[ "$UNAME" == "Darwin" ]]; then
    path=($HOME/dot/osx/bin $path)
fi

export GOPATH=$HOME/go

# for compiling Python
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include"
export PATH="/usr/local/opt/node@18/bin:$PATH"
source $HOME/.cargo/env

if [ -d "/opt/homebrew" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
