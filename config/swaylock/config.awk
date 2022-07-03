BEGIN { FS="="; OFS="=" }
/color/ { $2 = base00 }
/bs-hl-color/ { $2 = base0F }
/caps-lock-bs-hl-color/ { $2 = base0F }
/caps-lock-key-hl-color/ { $2 = base0B }
/key-hl-color/ { $2 = base0B }
/inside-clear-color/ { $2 = base03 }
/inside-ver-color/ { $2 = base03 }
/inside-wrong-color/ { $2 = base08 }
/ring-wrong-color/ { $2 = base08 }
/ring-color/ { $2 = base0A }
/ring-caps-lock-color/ { $2 = base0A }
/ring-clear-color/ { $2 = base0C }
/text-clear-color/ { $2 = base0C }
/ring-ver-color/ { $2 = base0D }
/text-color/ { $2 = base05 }
/text-caps-lock-color/ { $2 = base05 }
/text-ver-color/ { $2 = base05 }
/text-wrong-color/ { $2 = base05 }
{ print }
