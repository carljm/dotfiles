alias rmpyc="find . \( -name '*.pyc' -o -name '__pycache__' \) -print0 | xargs -0 rm -rf"
alias rmbak="find . -iname '*~' -delete"
alias dirsize="/home/carljm/dot/bin/dirsize.sh | sort -n | uniq"
alias pkgsize='/home/carljm/dot/bin/pkgsize.sh'

alias sshkey="ssh-add /home/carljm/.ssh/romaine_dsa"
alias sshtp="ssh tp -t screen -URD"
alias sshlt="ssh lt -A -t /home/carljm/dot/bin/scr"
alias sshpuffin="ssh puffin -t screen -URD"
alias sshsw="ssh sw"
alias sshmwr="ssh mwr"
alias sshrp="ssh rp"
alias sshcp="ssh cp -t screen -URD"
alias sshql="ssh ql"
alias sshbruce="ssh bruce"
alias sshpmc="ssh pmc"
alias sshdz="ssh dz -A -t scr"

alias mk24env="mkvirtualenv -p /opt/Python-2.4.6/bin/python"
alias mk25env="mkvirtualenv -p /opt/Python-2.5.6/bin/python"
alias mk26env="mkvirtualenv -p /opt/Python-2.6.8/bin/python"
alias mk27env="mkvirtualenv -p /opt/Python-2.7.5/bin/python"
alias mk32env="mkvirtualenv -p /opt/Python-3.2.4/bin/python3"
alias mk33env="mkvirtualenv -p /opt/Python-3.3.6/bin/python3"
alias mk34env="mkvirtualenv -p /opt/Python-3.4.1/bin/python3"
alias mkpypyenv="mkvirtualenv -p /opt/pypy-2.3.1-linux64/bin/pypy"
alias mkpypy3env="mkvirtualenv -p /opt/pypy3-2.3.1-linux64/bin/pypy"
alias mkvenv=mk27env

alias joe="emacs -nw"
alias emacs="emacs -nw"

alias fixssh="source ~/.sshvars"

alias rs="redshift -l 44.08:-103.25"

alias g=git

snr() {
    find . -type f -print0 | xargs -0 perl -pi -e "${1}"
    }

mketags() {
    CWD=`pwd`
    SP=`virtualenvwrapper_get_site_packages_dir`
    find $CWD $SP -path $CWD/.tox -prune -o -name '*.py' -print | etags -
}

mkctags() {
    CWD=`pwd`
    SP=`virtualenvwrapper_get_site_packages_dir`
    find $CWD $SP -name '*.py' -print0 | xargs -0 ctags -o .tags
}

djtests() {
    if [[ "$1" =~ ^db=.* ]]; then
        DB=${1#db=}
        shift
    else
        DB="sqlite"
    fi

    pushd tests/
    PYTHONHASHSEED="random" DJANGO_SETTINGS_MODULE=testconf.${DB} coverage run runtests.py $@
    popd
}
