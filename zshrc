#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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

eval "$(hub alias -s)"

alias sshig="et carljm.sb.facebook.com:8080 -c 'tmux -2CC new -AD -s devserver'"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include"

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/projects

alias mk27env="mkvirtualenv -p $(pythonz locate 2.7.16)"
alias mk36env="mkvirtualenv -p $(pythonz locate 3.6.8)"
alias mk37env="mkvirtualenv -p $(pythonz locate 3.7.3)"
alias mkvenv=mk37env
