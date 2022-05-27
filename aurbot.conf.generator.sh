#!/usr/bin/env bash

echo '[DEFAULT]
destination = /home/meowxiik/Cloud/AURPackages
var_dir = /home/meowxiik/aurbot
'

for p in `pacman -Qqm`; do
  maintainer=$(curl 'https://aur.archlinux.org/packages/'$p 2>/dev/null | grep 'Maintainer:</th>' -A4 | tr -d '[[:blank:]]' | tail -n1)

  if [[ -z "$maintainer" ]]; then
    maintainer=None
  fi

  echo \[$p\]
  echo "maintainer = $maintainer"
  echo
done
