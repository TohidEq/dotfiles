#!/usr/bin/env bash

EWK_FILE="$HOME/.config/eww/eww.yuck"

while true; do
  H=$(date +%I)
  M=$(date +%M)
  S=$(date +%S)

  hh=$(awk "BEGIN {printf \"%d\", ($H % 12) * 5 + ($M / 12)}")
  if [ "$hh" -lt 10 ]; then
    hh="0$hh"
  fi

  # echo "h: $hh"
  # echo "m: $M"
  # echo "s: $S"
  # hour
  sed -i -E "s|(url\('/home/arc/.config/clockimgs/hms/h/h-)[0-9]+(\.png'\))|\1$hh\2|" "$EWK_FILE"

  # minute
  sed -i -E "s|(url\('/home/arc/.config/clockimgs/hms/m/m-)[0-9]+(\.png'\))|\1$M\2|" "$EWK_FILE"

  # second
  sed -i -E "s|(url\('/home/arc/.config/clockimgs/hms/s/s-)[0-9]+(\.png'\))|\1$S\2|" "$EWK_FILE"

  sleep 30
done
