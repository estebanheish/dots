{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.modules.i3-status-rust;
in
{

  options = {
    modules.i3-status-rust.enable = mkEnableOption "i3-status-rust";
  };

  config = mkIf cfg.enable {
    hm.home.packages = [ pkgs.i3-status-rust ];
    hm.xdg.configFile."i3-status-rust".source = ./../../config/i3-status-rust/config.toml;
  };

}
