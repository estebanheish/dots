/^color=/ { $0 = "color=" cursor " " foreground }
/^background=/ { $0 = "background=" background }
/^foreground=/ { $0 = "foreground=" foreground }

/regular0=/ { $0 = "regular0=" base00 } # black
/regular1=/ { $0 = "regular1=" base08 } # red
/regular2=/ { $0 = "regular2=" base0B } # green
/regular3=/ { $0 = "regular3=" base0A } # yellow
/regular4=/ { $0 = "regular4=" base0D } # blue
/regular5=/ { $0 = "regular5=" base0E } # magenta 
/regular6=/ { $0 = "regular6=" base0C } # cyan 
/regular7=/ { $0 = "regular7=" base05 } # white

/bright0=/ { $0 = "bright0=" base00 }
/bright1=/ { $0 = "bright1=" base08 }
/bright2=/ { $0 = "bright2=" base0B }
/bright3=/ { $0 = "bright3=" base0A }
/bright4=/ { $0 = "bright4=" base0D }
/bright5=/ { $0 = "bright5=" base0E }
/bright6=/ { $0 = "bright6=" base0C }
/bright7=/ { $0 = "bright7=" base05 }

# # misc
# selection-background={{base05-hex}}
# selection-foreground={{base00-hex}}
# urls={{base04-hex}}
# jump-labels={{base00-hex}} {{base0A-hex}}
# scrollback-indicator={{base00-hex}} {{base04-hex}}

{ print }
