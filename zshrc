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

alias sshig="et carljm@carljm.sb.facebook.com:8080 -c 'tmux -2CC new -AD -s devserver'"

# for compiling Python
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/openssl/include"

export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/projects

if [[ -s $HOME/.pythonz/etc/bashrc ]]; then
    source $HOME/.pythonz/etc/bashrc
    alias mk27env="mkvirtualenv -p $(pythonz locate 2.7.18)"
    alias mk37env="mkvirtualenv -p $(pythonz locate 3.7.9)"
    alias mk38env="mkvirtualenv -p $(pythonz locate 3.8.7)"
    alias mk39env="mkvirtualenv -p $(pythonz locate 3.9.1)"
    alias mkvenv=mk39env
    function pythonz() {
      EXTRA_CONFIGURE_FLAGS="--with-openssl=$(brew --prefix openssl)"
      if [[ "$1" == "install" ]]; then
        shift 1
        command pythonz install $1 --configure="$EXTRA_CONFIGURE_FLAGS"
      else
        command pythonz "$@"
      fi
    }  
fi
