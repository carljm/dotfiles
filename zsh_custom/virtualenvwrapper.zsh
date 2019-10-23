export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"

VENVWRAPPER=`which virtualenvwrapper.sh 2>/dev/null`
if [ -n "$VENVWRAPPER" ]; then
    export WORKON_HOME=$HOME/.venvs
    export PROJECT_HOME=$HOME/projects
    source $VENVWRAPPER
    
    alias mk27env="mkvirtualenv -p $(pythonz locate 2.7.16)"
    alias mk36env="mkvirtualenv -p $(pythonz locate 3.6.8)"
    alias mk37env="mkvirtualenv -p $(pythonz locate 3.7.3)"
    alias mkvenv=mk37env
fi
