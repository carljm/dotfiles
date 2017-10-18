alias rmpyc="find . \( -name '*.pyc' -o -name '__pycache__' \) -print0 | xargs -0 rm -rf"
alias rmbak="find . -iname '*~' -delete"
alias dirsize="/home/carljm/dot/bin/dirsize.sh | sort -n | uniq"
alias pkgsize='/home/carljm/dot/bin/pkgsize.sh'

alias sshlt="echo -ne '\033]0;screen[lettuce]\007' && ssh lt -A -t /home/carljm/dot/bin/scr"
alias sshch="echo -ne '\033]0;screen[chard]\007' && ssh chard.carljm.me -A -t /home/carljm/dot/bin/scr"
alias sshqs="echo -ne '\033]0;screen[qatalyst-stage]\007' && ssh qatalyst-stage -A -t /home/cmeyer/dot/bin/scr"
alias sshig="echo -ne '\033]0;tmux[ig]\007' && mosh -6 igds -- tmux new -s devserver -AD"
alias sshcp="ssh cp -t screen -URD"
alias sshbruce="ssh bruce"

alias mk27env="mkvirtualenv -p /home/carljm/pythons/Python-2.7.13/bin/python"
alias mk33env="mkvirtualenv -p /home/carljm/pythons/Python-3.3.6/bin/python3"
alias mk34env="mkvirtualenv -p /home/carljm/pythons/Python-3.4.4/bin/python3"
alias mk35env="mkvirtualenv -p /home/carljm/pythons/Python-3.5.1/bin/python3"
alias mk36env="mkvirtualenv -p /home/carljm/pythons/Python-3.6.3/bin/python3"
alias mkpypyenv="mkvirtualenv -p /home/carljm/pythons/pypy-5.1.1-linux_x86_64-portable/bin/pypy"
alias mkpypy3env="mkvirtualenv -p /home/carljm/pythons/pypy3.5-5.7.1-beta-linux_x86_64-portable/bin/pypy"
alias mkvenv=mk36env

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
