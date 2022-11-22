/^\$foreground:/ { $0 = "$foreground: #" foreground ";" }
/^\$background:/ { $0 = "$background: #" background ";" }
/^\$backgroundrgba:/ { $0 = "$backgroundrgba: " backgroundrgba ";" }
/^\$focus:/ { $0 = "$focus: #" focus ";" }

{ print }
