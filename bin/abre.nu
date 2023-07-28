#!/usr/bin/env nu

def main [file: path] {
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
