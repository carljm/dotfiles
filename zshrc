UNAME=$(uname)

if [[ "$UNAME" == "Darwin" ]]; then
    export PATH="$HOME/dot/osx/bin:$PATH"
fi

export PATH="$HOME/dot/bin:$HOME/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/dot/oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

ZSH_CUSTOM="$HOME/dot/zsh_custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git nvm)

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"
