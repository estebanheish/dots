/waybar-background/ { $0 = "    background: #" background "; /* waybar-background */" }
/waybar-foreground/ { $0 = "    color: #" foreground "; /* waybar-foreground */" }
/ foreground / { $0 = "    color: #" foreground "; /* foreground */" }
/ focus / { $0 = "    background: #" focus "; /* focus */" }
/ background / { $0 = "    color: #" background "; /* background */" }
/ rojo / { $0 = "    color: #" base08 "; /* rojo */" }
/ amarillo / { $0 = "    color: #" base0A "; /* amarillo */" }
/ verde / { $0 = "    color: #" base0B "; /* verde */" }
{ print }
