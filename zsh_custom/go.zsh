if [[ -d "$HOME/go" && -d "/usr/local/go/bin" ]]; then
    export GOPATH=$HOME/go
    export PATH="/usr/local/go/bin:$HOME/go/bin:$PATH"
fi

