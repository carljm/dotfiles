alias rmpyc="find . \( -name '*.pyc' -o -name '__pycache__' \) -print0 | xargs -0 rm -rf"
alias rmbak="find . -iname '*~' -delete"
alias dirsize="/home/carljm/dot/bin/dirsize.sh | sort -n | uniq"

alias sshch="echo -ne '\033]0;screen[chard]\007' && ssh chard.carljm.me -A -t /home/carljm/dot/bin/scr"

alias emacs="emacs -nw"

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
