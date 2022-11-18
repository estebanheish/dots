/^\$background=/ { $0 = "$background=" background }
/^\$foreground=/ { $0 = "$foreground=" foreground }
/^\$focus=/ { $0 = "$focus=" focus }

{ print }
