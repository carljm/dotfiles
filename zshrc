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

path=($HOME/dot/bin $HOME/.cargo/bin /usr/local/go/bin $HOME/go/bin $path)

UNAME=$(uname)
if [[ "$UNAME" == "Darwin" ]]; then
    path=($HOME/dot/osx/bin $path)
fi

export GOPATH=$HOME/go

alias sshig="x2ssh -et devvm6043.atn0.facebook.com -c 'tmux -CC new -AD -s devserver'"

# for compiling Python
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include"

export VIRTUALENVWRAPPER_PYTHON=$(pyenv which python3.10)
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/projects

if [[ -d $HOME/.pyenv/shims ]]; then
    path=($HOME/.pyenv/shims $path)
    alias mk38env="mkvirtualenv -p $(pyenv which python3.8)"
    alias mk39env="mkvirtualenv -p $(pyenv which python3.9)"
    alias mk310env="mkvirtualenv -p $(pyenv which python3.10)"
    alias mk311env="mkvirtualenv -p $(pyenv which python3.11)"
    alias mk312env="mkvirtualenv -p $(pyenv which python3.12)"
    alias mkvenv=mk311env
    eval "$(pyenv init -)"
fi
export PATH="/usr/local/opt/node@18/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
