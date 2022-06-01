/^color=/ { $0 = "color=" cursor " " foreground }
/^background=/ { $0 = "background=" background }
/^foreground=/ { $0 = "foreground=" foreground }

/regular0=/ { $0 = "regular0=" base00 }
/regular1=/ { $0 = "regular1=" base08 }
/regular2=/ { $0 = "regular2=" base0B }
/regular3=/ { $0 = "regular3=" base0A }
/regular4=/ { $0 = "regular4=" base0D }
/regular5=/ { $0 = "regular5=" base0E }
/regular6=/ { $0 = "regular6=" base0C }
/regular7=/ { $0 = "regular7=" base05 }

/bright0=/ { $0 = "bright0=" base03 }
/bright1=/ { $0 = "bright1=" base09 }
/bright2=/ { $0 = "bright2=" base01 }
/bright3=/ { $0 = "bright3=" base02 }
/bright4=/ { $0 = "bright4=" base04 }
/bright5=/ { $0 = "bright5=" base06 }
/bright6=/ { $0 = "bright6=" base0F }
/bright7=/ { $0 = "bright7=" base07 }

{ print }
