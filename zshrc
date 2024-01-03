#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

path=($HOME/bin $path)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/dot/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/dot/prezto/init.zsh"
fi

path=($HOME/dot/bin $HOME/.local/bin $HOME/.cargo/bin /usr/local/go/bin $HOME/go/bin $path)

UNAME=$(uname)
if [[ "$UNAME" == "Darwin" ]]; then
    path=($HOME/dot/osx/bin $path)
fi

export GOPATH=$HOME/go

alias sshig="x2ssh -et devvm6043.atn0.facebook.com -c 'tmux -CC new -AD -s devserver'"

# for compiling Python
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include"

export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/projects

if [[ -d $HOME/.pyenv/shims ]]; then
    path=($HOME/.pyenv/shims $path)
    alias mk37env="mkvirtualenv -p $(pyenv which python3.7)"
    alias mk38env="mkvirtualenv -p $(pyenv which python3.8)"
    alias mk39env="mkvirtualenv -p $(pyenv which python3.9)"
    alias mk310env="mkvirtualenv -p $(pyenv which python3.10)"
    alias mkvenv=mk310env
    eval "$(pyenv init -)"
fi
