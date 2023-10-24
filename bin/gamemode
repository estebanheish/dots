#!/usr/bin/env nu

let args = [
    "keyword monitor desc:BNQ ZOWIE XL LCD XBG00968SL0, 1920x1080@240Hz, 0x0, 1;"
    "keyword monitor desc:LG Electronics LG HDR 4K 204NTGYHG007, disable;"
    "keyword monitor desc:LG Electronics LG ULTRAWIDE 0x00009E0B, disable;"
    # "keyword animations:enabled 0;"
    # "keyword decoration:drop_shadow 0;"
    # "keyword decoration:blur:enabled 0;"
    # "keyword general:gaps_in 0;"
    # "keyword general:gaps_out 0;"
    # "keyword general:border_size 2;"
    # "keyword decoration:rounding 0"  
]

if (hyprctl monitors -j | from json | length) == 2 {
    hyprctl --batch $"($args | str join ' ')"
} else {
    hyprctl reload
}

