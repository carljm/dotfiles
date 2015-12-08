alias rmpyc="find . \( -name '*.pyc' -o -name '__pycache__' \) -print0 | xargs -0 rm -rf"
alias rmbak="find . -iname '*~' -delete"
alias dirsize="/home/carljm/dot/bin/dirsize.sh | sort -n | uniq"
alias pkgsize='/home/carljm/dot/bin/pkgsize.sh'

alias sshlt="echo -ne '\033]0;screen[lettuce]\007' && ssh lt -A -t /home/carljm/dot/bin/scr"
alias sshqs="echo -ne '\033]0;screen[qatalyst-stage]\007' && ssh qatalyst-stage -A -t /home/cmeyer/dot/bin/scr"
alias sshcp="ssh cp -t screen -URD"
alias sshbruce="ssh bruce"

alias mk26env="mkvirtualenv -p /home/carljm/pythons/Python-2.6.9/bin/python"
alias mk27env="mkvirtualenv -p /home/carljm/pythons/Python-2.7.9/bin/python"
alias mk32env="mkvirtualenv -p /home/carljm/pythons/Python-3.2.6/bin/python3"
alias mk33env="mkvirtualenv -p /home/carljm/pythons/Python-3.3.6/bin/python3"
alias mk34env="mkvirtualenv -p /home/carljm/pythons/Python-3.4.2/bin/python3"
alias mk35env="mkvirtualenv -p /home/carljm/pythons/Python-3.5.0/bin/python3"
alias mkpypyenv="mkvirtualenv -p /home/carljm/pythons/pypy-2.6.1-linux64/bin/pypy"
alias mkpypy3env="mkvirtualenv -p /home/carljm/pythons/pypy3-2.4.0-linux64/bin/pypy"
alias mkvenv=mk27env

alias emacs="emacs -nw"

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

ap8() {
    file=$1
    autopep8 --in-place --aggressive --aggressive ${file}
}
