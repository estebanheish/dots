#!/usr/bin/env bash
# el color (argumento) sin comillas
fd -e svg '' | while read -r file; do 
  rm "${file%.*}.png"
  inkscape -w 512 <(sed "s/iconcolor/${1}/g" "${file}") -o "${file%.*}.png"  
done
