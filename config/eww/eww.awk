/^\$foreground:/ { $0 = "$foreground: #" foreground ";" }
/^\$background:/ { $0 = "$background: #" background ";" }
/^\$focus:/ { $0 = "$focus: #" focus ";" }

{ print }
