#!/bin/bash

function alerte {
    local message=$1
    echo "/!\ SEC: ${message}."
}

ug00_line=$(grep "^[^:]*:[^:]*:0:0:" /etc/passwd)

if [ -z "$ug00_line" ]; then
    echo "Pas d'utilisateur (uid 0, gid 0) : Excellent !"
    exit 0
fi

echo "Un utilisateur (uid 0, gid 0) existe sur ce système :"
echo $ug00_line

ug00_login=$(echo $ug00_line | cut -d: -f5)
ug00_shell=$(echo $ug00_line | cut -d: -f7)

echo -n "login: "
echo $ug00_login
if [ "$ug00_login" = "root" ]; then
    alerte "Changer le nom de l'utilisateur root."
fi

echo -n "shell: "
echo $ug00_shell

case "$ug00_shell" in
  *sh)
    alerte "Il semble que (0, 0) ait un login shell."
    ;;
esac
