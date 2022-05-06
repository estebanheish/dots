{
# basic 
sudo = "doas";

# Verbosity and settings that you pretty much just always are going to want.
cp = "cp -iv";
mv = "mv -iv";
rm = "rm -v";
mkd = "mkdir -pv";

# Colorize commands when possible.
ls = "ls -hN --color=auto --group-directories-first";
grep = "grep --color=auto";
diff = "diff --color=auto";
ip = "ip --color=auto";

# These common commands are just too long! Abbreviate them.
ka = "killall";
g = "git";
e = "$EDITOR";
v = "$EDITOR";
z = "$READER";
o = "$OPENER";
b = "$BROWSER";
bs = "bashmount";
wlp = "wl-paste";
mpw = "mpv \"$(wl-paste)\"";
#bat = "cat /sys/class/power_supply/BAT?/capacity";

# NixOS
nu = "doas nixos-rebuild switch";
ngc = "nix-collect-garbage -d";

# RCLONE SHORTCUTS
cloudsync = "rclone sync ~/.ghome ghome:HOME -L -P && notify-send 'GHOME' 'Cloud synced'";
localsync = "rclone sync ghome:HOME ~/.ghome -L -P && notify-send 'GHOME' 'Local synced'";
rsynclocalmusic = "rclone sync ghome:/HOME/Music ~/.ghome/Music -L -P && notify-send 'GHOME' 'Local music synced'";
rsynclocaldocs = "rclone sync ghome:HOME/Documents ~/.ghome/Documents -L -P && notify-send 'GHOME' 'Local documents synced'";
rsynclocalpics = "rclone sync ghome:HOME/Pictures ~/.ghome/Pictures -L -P && notify-send 'GHOME' 'Local pictures synced'";
rsynclocalvids = "rclone sync ghome:HOME/Videos ~/.ghome/Videos -L -P && notify-send 'GHOME' 'Local videos synced'";
rsynclocalorg = "rclone sync ghome:HOME/org ~/.ghome/org -L -P && notify-send 'GHOME' 'Local org synced'";
rsynccloudmusic = "rclone sync ~/.ghome/Music ghome:/HOME/Music -L -P && notify-send 'GHOME' 'Cloud music synced'";
rsyncclouddocs = "rclone sync ~/.ghome/Documents ghome:HOME/Documents -L -P && notify-send 'GHOME' 'Cloud documents synced'";
rsynccloudpics = "rclone sync ~/.ghome/Pictures ghome:HOME/Pictures -L -P && notify-send 'GHOME' 'Cloud pictures synced'";
rsynccloudvids = "rclone sync ~/.ghome/Videos ghome:HOME/Videos -L -P && notify-send 'GHOME' 'Cloud videos synced'";
rsynccloudorg = "rclone sync ~/.ghome/org ghome:HOME/org -L -P && notify-send 'GHOME' 'Cloud org synced'";
}
