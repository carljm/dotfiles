#!/bin/sh
# from http://mercurial.selenic.com/wiki/MergingWithEmacs

set -e # bail out quickly on failure

LOCAL="$1"
BASE="$2"
OTHER="$3"

BACKUP="$LOCAL.orig"

Restore ()
{
    cp "$BACKUP" "$LOCAL" 
}

ExitOK ()
{
    exit $?
}

# Back up our file
cp "$LOCAL" "$BACKUP"

# Attempt to do a non-interactive merge
if which merge > /dev/null 2>&1 ; then
    if merge "$LOCAL" "$BASE" "$OTHER" 2> /dev/null; then
        # success!
        ExitOK 
    fi
    Restore
elif which diff3 > /dev/null 2>&1 ; then
    if diff3 -m "$BACKUP" "$BASE" "$OTHER" > "$LOCAL" ; then
        # success
        ExitOK
    fi
    Restore
fi

if emacs -q --no-site-file --eval "(ediff-merge-with-ancestor \"$BACKUP\" \"$OTHER\" \"$BASE\" nil \"$LOCAL\")" 
then       
    ExitOK
fi

echo "emacs-merge: failed to merge files"
exit 1

# End of file
