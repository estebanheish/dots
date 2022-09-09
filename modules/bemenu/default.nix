{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.bemenu;

  background = "#2E3440";
  foreground = "#E5E9F0";
  foregroundalt = "#D8DEE9";
  focus = "#EEF0F5";


  bargs = ''-i -p ''' - H 25 \
     --fn 'Ubuntu bold 15' \
     --tb '${background}' \
     --tf '${foreground}' \
     --fb '${background}' \
     --ff '${foreground}' \
     --nb '${background}' \
     --nf '${foreground}' \
     --hb '${focus}' \
     --hf '${background}' \
     --sb '${background}' \
     --sf '${foreground}' \
     --af '${foregroundalt}' \
     --ab '${background}'
  '';

  bmenu = pkgs.writeScriptBin "bmenu" "${pkgs.bemenu}/bin/bemenu-run ${bargs}";
  bfiles = pkgs.writeScriptBin "bfiles" ''${pkgs.xdg-utils}/bin/xdg-open "$(${pkgs.fd}/bin/fd --search-path ~ --search-path /run/media -tf | ${pkgs.bemenu}/bin/bemenu -l 20 ${bargs})"'';
in
{

  options = {
    modules.bemenu.enable = mkEnableOption "bemenu";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ bmenu bfiles ];
  };

}


