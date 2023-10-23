#!/usr/bin/env nu

def main [] {

  let file = (fd -tf 
    --search-path ~/Documents 
    --search-path ~/Downloads 
    --search-path ~/Videos 
    --search-path ~/Pictures 
    --search-path /mnt/data/media 
    --search-path ~/Music 
    | tofi -c ~/.config/tofi/config_list)

  let type = ($file | path type)

  if $type != "file" {
    print --stderr 'not a file'
    exit 1
  }

  let mime_type = (ls $file --mime-type | get type | split row '/')
  match $mime_type {
    ["text", _] => { foot hx $file }
    ["image", _] => { imv $file }
    ["video", _] => { mpv $file }
    ["audio", _] => { mpc update; mpc insert ($file | path split | skip while {|it| $it != 'Music'} | skip 1 | path join) ; mpc next }
    ["application", "pdf"] => { zathura $file }
    _ => { print --stderr "can't open this"; exit 1 }
  }
}
