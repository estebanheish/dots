alias sudo = doas
alias ka = killall
alias e = ^zeditor -n
alias v = ^$env.EDITOR
alias r = ^$env.READER
alias o = ^$env.OPENER
alias b = ^$env.BROWSER
alias q = qalc
alias l = ls
alias la = ls -a
alias ll = ls -l
alias zed = zeditor -n
alias log = journalctl
alias sctl = systemctl
alias vault = zed ~/Documents/Vault
alias brillo = ddcutil setvcp 10
alias mixer = ncpamixer

alias wlp = wl-paste
alias mpw = mpv (wl-paste)
alias empty_trash = rm -rp ~/.local/share/Trash/*

# NixOS
alias rebuild = doas nixos-rebuild switch --flake ~/.dots
def garbage [] { nix-collect-garbage -d; doas nix-collect-garbage -d }
alias switch-to-config = doas /run/current-system/bin/switch-to-configuration boot
alias noswallow = print $"(ansi title)noswallow(ansi st)" -n
def npl [] { nix profile list --json | (from json).elements | columns }
def remove [...pkgs: string] {
  if ($pkgs | is-empty) {
    nix profile remove (npl | input list)
  } else {
    let selected = (npl | where {|pkg| $pkgs | any {|b| $pkg =~ $b }})
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

def install-unfree [--flake (-f): string = "nixpkgs", ...pkgs] {
  NIXPKGS_ALLOW_UNFREE=1 nix profile install ...($pkgs | each {|pkg| $"($flake)#($pkg)"}) --impure
}

# yt-dlp
alias ytm = yt-dlp -x (wl-paste) -o "~/Music/%(title)s.%(ext)s" --audio-quality best
alias ytv = yt-dlp (wl-paste) -o "~/Videos/%(title)s.%(ext)s"
alias yt = yt-dlp (wl-paste)
alias yta = yt-dlp -x (wl-paste) --audio-quality best
def ffix [f: string] {ffmpeg -i $f -c copy ($f | str substring 0..-6)}
def to_av1 [original: string, --crf: int = 35, --rename_old (-r)] {
  let av1_filename = $original | path parse | update stem {|o| $o.stem + "_av1"} | update extension "mkv" | path join
  if ($av1_filename | path exists) {
    print "already converted"
    return
  }
  (ffmpeg 
    -i $original 
    -c:v libsvtav1 
    -crf $crf
    -preset 3 
    $av1_filename)
  if $rename_old {
    let new_original = $original | path parse | update stem {|o| $o.stem + "_original"} | path join
    mv $original $new_original
  }
}

def transmission-remove [] { transmission-remote -l | detect columns | where Done == "100%" | get ID | transmission-remote -t $in -r }

def sp [...txt: string] { $txt | str join " " | hunspell -d es_ES,en_US }

alias zj = zellij
alias zz = zellij --session
alias lg = lazygit

# wezterm
def wt [name: string] { wezterm cli set-tab-title $name }

alias pa = playerctl --all-players pause
alias bt = bluetuith

def cas [file: path] { 
  let stem = ($file | path parse | get stem); 
  as $file -o $"($stem).o"; ld $"($stem).o" -o $stem
}

def flattenfolder [] { glob */** -D | each {|f| mv $f . | ignore} } 

# games
alias deadlock = steam steam://rungameid/1422450
alias cyberpunk = steam steam://rungameid/1091500
