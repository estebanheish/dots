alias sudo = doas
alias lfcd = cd (_lfcd_cmd)

alias ka = killall
alias e = ^$env.EDITOR
alias v = ^$env.EDITOR
alias z = ^$env.READER
alias o = ^$env.OPENER
alias b = ^$env.BROWSER
alias l = ls
alias la = ls -a
alias ll = ls -l

alias wlp = wl-paste
alias mpw = mpv (wl-paste)

# NixOS
alias rebuild = doas nixos-rebuild switch --flake ~/.nyx
alias garbage = nix-collect-garbage -d
alias switch-to-config = doas /run/current-system/bin/switch-to-configuration boot
alias npl = nix profile list
