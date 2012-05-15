#!/bin/bash

if [ "x$EDITOR" = "x" ];
then
        EDITOR=vi
fi

if [ "x$1" = "x-f"  ]
then
    autoscan
    [ -f "configure.in" ] && cp "configure.in" "configure.in.old"
    mv -f "configure.scan" "configure.in"
    echo "## This is just AUTOSCAN draft of configure.in"
    $EDITOR "configure.in"
fi

### použít jen když je třeba použít configure.h.in
#autoheader

aclocal-1.10 \
&& automake-1.10 -a -c \
&& autoconf
