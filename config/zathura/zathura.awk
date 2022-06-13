/^set highlight-active-color/ { $0 = "set highlight-active-color \"#" base0D "\"" }
/^set highlight-color/  { $0 = "set highlight-color \"#" base0A "\"" }

/^set default-fg/ { $0 = "set default-fg \"#" base00 "\"" }
/^set default-bg/ { $0 = "set default-bg \"#" base01 "\"" }

/^set completion-fg/ { $0 = "set completion-fg \"#" base0D "\"" }
/^set completion-bg/ { $0 = "set completion-bg \"#" base01 "\"" }

/^set completion-highlight-fg/ { $0 = "set completion-highlight-fg \"#" base07 "\"" }
/^set completion-highlight-bg/ { $0 = "set completion-highlight-bg \"#" base0D "\"" }

/^set index-active-fg/ { $0 = "set index-active-fg \"#" background "\"" }
/^set index-active-bg/ { $0 = "set index-active-bg \"#" focus "\"" }

/^set index-fg/ { $0 = "set index-fg \"#" foreground "\"" }
/^set index-bg/ { $0 = "set index-bg \"#" background "\"" }

/^set inputbar-fg/ { $0 = "set inputbar-fg \"#" base07 "\"" }
/^set inputbar-bg/ { $0 = "set inputbar-bg \"#" base00 "\"" }

/^set notification-fg/ { $0 = "set notification-fg \"#" base07 "\"" }
/^set notification-bg/ { $0 = "set notification-bg \"#" base00 "\"" }

/^set notification-error-fg/ { $0 = "set notification-error-fg \"#" base08 "\"" }
/^set notification-error-bg/ { $0 = "set notification-error-bg \"#" base00 "\"" }

/^set notification-warning-fg/ { $0 = "set notification-warning-fg \"#" base08 "\"" }
/^set notification-warning-bg/ { $0 = "set notification-warning-bg \"#" base00 "\"" }

/^set recolor-darkcolor/ { $0 = "set recolor-darkcolor \"#" base06 "\"" }
/^set recolor-lightcolor/ { $0 = "set recolor-lightcolor \"#" base00 "\"" } 

/^set render-loading-fg/ { $0 = "set render-loading-fg \"#" foreground "\"" }
/^set render-loading-bg/ { $0 = "set render-loading-bg \"#" background "\"" }

/^set statusbar-fg/ { $0 = "set statusbar-fg \"#" base04 "\"" }
/^set statusbar-bg/ { $0 = "set statusbar-bg \"#" base02 "\"" }

{ print }
