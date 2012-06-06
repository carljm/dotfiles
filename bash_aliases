alias rmpyc="find . -iname '*.pyc' -delete"
alias rmbak="find . -iname '*~' -delete"
alias dirsize="/home/carljm/dot/bin/dirsize.sh | sort -n | uniq"
alias pkgsize='/home/carljm/dot/bin/pkgsize.sh'

alias sshkey="ssh-add /home/carljm/.ssh/romaine_dsa"
alias sshtp="ssh tp -t screen -URD"
alias sshlt="ssh lt -t screen -URD"
alias sshpuffin="ssh puffin -t screen -URD"
alias sshsw="ssh sw"
alias sshmwr="ssh mwr"
alias sshrp="ssh rp"
alias sshcp="ssh cp -t screen -URD"
alias sshql="ssh ql"
alias sshbruce="ssh bruce"
alias sshpmc="ssh pmc"
alias sshdz="ssh dz -A -t scr"

alias python2.4=/opt/Python-2.4.6/bin/python
alias python2.5=/opt/Python-2.5.6/bin/python
alias python2.6=/opt/Python-2.6.8/bin/python
alias python3.2=/opt/Python-3.2.3/bin/python3

alias mk24env="mkvirtualenv -p /opt/Python-2.4.6/bin/python"
alias mk25env="mkvirtualenv -p /opt/Python-2.5.6/bin/python"
alias mk26env="mkvirtualenv -p /opt/Python-2.6.8/bin/python"
alias mk27env="mkvirtualenv -p /opt/Python-2.7.3/bin/python"
alias mk32env="mkvirtualenv -p /opt/Python-3.2.3/bin/python3"
alias mkvenv=mk27env

alias joe="emacs -nw"
alias emacs="emacs -nw"

alias fixssh="source ~/.sshvars"
