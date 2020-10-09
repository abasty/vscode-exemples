#!/bin/sh

ug00_line=root:x:0:0:root:/root:/bin/bash

if [ -z "" ]; then
    echo "Pas d'utilisateur (uid 0, gid 0) : Excellent !"
    exit 0
fi

echo "Un utilisateur (uid 0, gid 0) existe sur ce système :"
echo

ug00_login=
ug00_shell=

echo -n "login: "
echo
if [ "" = "root" ]; then
    echo "/!\ SEC: changer le nom de l'utilisateur root."
fi

echo -n "shell: "
echo

case "" in
  *sh)
    echo "/!\ SEC: Il semble que (0, 0) ait un login shell."
    ;;
esac
