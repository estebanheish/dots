#!/usr/bin/env bash

loadwal () {
  if [ -e ~/.cache/wal/colors.sh ]; then
      . ~/.cache/wal/colors.sh
      focus=${cursor#\#}
      foreground=${foreground#\#}
      background=${background#\#}
      base00=${color0#\#}
      base01=${color1#\#}
      base02=${color2#\#}
      base03=${color3#\#}
      base04=${color4#\#}
      base05=${color5#\#}
      base06=${color6#\#}
      base07=${color7#\#}
      base08=${color8#\#}
      base09=${color9#\#}
      base0A=${color10#\#}
      base0B=${color11#\#}
      base0C=${color12#\#}
      base0D=${color13#\#}
      base0E=${color14#\#}
      base0F=${color15#\#}
  else
      echo "aborting: file 'colors.sh' not found"; exit
  fi
}

test_missing() {
  [ -z $base00 -o \
    -z $base01 -o \
    -z $base02 -o \
    -z $base03 -o \
    -z $base04 -o \
    -z $base05 -o \
    -z $base06 -o \
    -z $base07 -o \
    -z $base08 -o \
    -z $base09 -o \
    -z $base0A -o \
    -z $base0B -o \
    -z $base0C -o \
    -z $base0D -o \
    -z $base0E -o \
    -z $base0F -o \
    -z $foreground -o \
    -z $background -o \
    -z $focus ]
}

change_colors() {
  awk \
    -i inplace \
    -v focus=$focus \
    -v background=$background \
    -v foreground=$foreground \
    -v cursor=$focus \
    -v base00=$base00 \
    -v base01=$base01 \
    -v base02=$base02 \
    -v base03=$base03 \
    -v base04=$base04 \
    -v base05=$base05 \
    -v base06=$base06 \
    -v base07=$base07 \
    -v base08=$base08 \
    -v base09=$base09 \
    -v base0A=$base0A \
    -v base0B=$base0B \
    -v base0C=$base0C \
    -v base0D=$base0D \
    -v base0E=$base0E \
    -v base0F=$base0F \
    -f $1 \
    $2
}

if [ $# -gt 0 ]; then
  echo "applying provided theme: ${1}"
  . $1

  test_missing && echo "aborting: missing theme atributes" && exit
else
  echo "using pywal cached theme"
  loadwal
fi

change_colors ./../../config/yambar/yambar.awk ./../../config/yambar/config.yml
change_colors ./../../config/river/init.awk ./../../config/river/init
change_colors ./../../config/mako/mako.awk ./../../config/mako/config
change_colors ./../../config/foot/foot.awk ./../../config/foot/foot.ini
change_colors ./../../config/zathura/zathura.awk ./../../config/zathura/zathurarc
change_colors ./../../config/qutebrowser/qutebrowser.awk ./../../config/qutebrowser/config.py

echo "done"
