#!/bin/sh

set -ex
THEME=${THEME:-default}
if ! test -e sigal.conf.py; then 
  sigal init
  sed -i -e "/^#/d;/^$/d;s/theme = .*/theme = \'${THEME}\'/" sigal.conf.py
fi
exec "$@"
