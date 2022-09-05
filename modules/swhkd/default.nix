{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.swhkd;
in
{
  options = {
    modules.swhkd.enable = mkEnableOption "swhkd";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.swhkd ];
    # environment.etc."swhkd/swhkdrc".source = ./../../config/swhkd/swhkdrc;
    hm.xdg.configFile."swhkd/swhkdrc".source = ./../../config/swhkd/swhkdrc;
  };
}

