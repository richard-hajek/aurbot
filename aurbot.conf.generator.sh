#!/usr/bin/env bash

echo '[DEFAULT]
build_cmd = makepkg -s --noconfirm --skippgpcheck
commit_cmd = bash -c 'mv *.pkg.* ~/Cloud/AURPackages'
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
