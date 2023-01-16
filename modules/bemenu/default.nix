{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.bemenu;

background = "#1C1C1C";
foreground = "#FFFFFF";
foregroundalt = "#e5e5e5";
focus = "#5e5086";

  bemenu = "${pkgs.bemenu}/bin/bemenu";
  cliphist = "${pkgs.cliphist}/bin/cliphist";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";

  bargs = ''-i -p ''' -H 25 \
     --fn 'Ubuntu bold 15' \
     --tb '${background}' \
     --tf '${foreground}' \
     --fb '${background}' \
     --ff '${foreground}' \
     --nb '${background}' \
     --nf '${foreground}' \
     --hb '${focus}' \
     --hf '${foreground}' \
     --sb '${background}' \
     --sf '${foreground}' \
     --af '${foregroundalt}' \
     --ab '${background}' \
     '';

  bmenu = pkgs.writeScriptBin "bmenu" "${pkgs.bemenu}/bin/bemenu-run ${bargs}";
  bfiles = pkgs.writeScriptBin "bfiles" ''${pkgs.xdg-utils}/bin/xdg-open "$(${pkgs.fd}/bin/fd --search-path ~/Documents --search-path ~/Downloads --search-path ~/Videos --search-path ~/media --search-path /run/media -tf | ${pkgs.bemenu}/bin/bemenu -l 20 ${bargs})"'';
  bclip = pkgs.writeScriptBin "bclip" "${cliphist} list | ${bemenu} -l 20 ${bargs} | ${cliphist} decode | ${wl-copy}";
in
{

  options = {
    modules.bemenu.enable = mkEnableOption "bemenu";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ bmenu bfiles bclip ];
  };

}


