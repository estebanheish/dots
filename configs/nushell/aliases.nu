alias sudo = doas
alias lfcd = cd (_lfcd_cmd)

alias ka = killall
alias e = ^$env.EDITOR
alias v = ^$env.EDITOR
alias r = ^$env.READER
alias o = ^$env.OPENER
alias b = ^$env.BROWSER
alias q = qalc
alias l = ls
alias la = ls -a
alias ll = ls -l

alias wlp = wl-paste
alias mpw = mpv (wl-paste)

# NixOS
alias rebuild = doas nixos-rebuild switch --flake ~/.nyx
def garbage [] { nix-collect-garbage -d; doas nix-collect-garbage -d }
alias switch-to-config = doas /run/current-system/bin/switch-to-configuration boot
alias noswallow = print $"(ansi title)noswallow(ansi st)" -n
def npl [] = { nix profile list --json | (from json).elements | select attrPath originalUrl | rename pkg flake | update pkg { str substring 28.. } | update flake { str substring 6.. } }
def remove [...pkgs: string] {
  if ($pkgs | is-empty) {
    let pkgs = (nix profile list --json | (from json).elements.attrPath | str substring 28..)
    nix profile remove ($pkgs | enumerate | move item --before index | transpose -r -d | get ($pkgs | input list -f))
  } else {
    let selected = (nix profile list --json | (from json).elements.attrPath | filter {|a| $pkgs | any {|b| $a =~ $b}})
    if not ($selected | is-empty) {
      nix profile remove ...$selected
    } else {
      remove
    }
  }
}
def install [--flake (-f): string = "nixpkgs", ...pkgs] {
  nix profile install ...($pkgs | each {|pkg| $"($flake)#($pkg)"})
}


# yt-dlp
alias ytda = yt-dlp -x (wl-paste) -o "~/Music/%(title)s.%(ext)s"
alias ytdv = yt-dlp (wl-paste) -o "~/Videos/%(title)s.%(ext)s"

def transmission-remove [] { transmission-remote -l | detect columns | where Done == "100%" | get ID | transmission-remote -t $in -r }

alias zj = zellij
alias zz = zellij --session
alias lg = lazygit
