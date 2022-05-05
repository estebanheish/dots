{ config, lib, pkgs, ... }:

with lib; 
let
  cfg = config.modules.sway;
in { 

  options = {
    modules.sway.enable = mkEnableOption "swaywm configuration";
  };

  config = mkIf cfg.enable {
    programs.xwayland.enable = true;
    programs.sway.enable = true;
    
    fonts.fonts = with pkgs; [ ubuntu_font_family ];
    
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      gtkUsePortal = false;
    };
    
    services.greetd = {
      enable = true;
      package = "greetd.tuigreet";
      restart = true;
      settings = {
        default_session = {
            command = "${lib.makeBinPath [pkgs.greetd.tuigreet] }/tuigreet --time --cmd sway";
            user = "greeter";
        };
      };
    };

    users.users.greeter.group = "greeter";
    users.groups.greeter = {};

    hm.xdg.configFile = {
      "sway" = {
        source = ./../../config/sway;
	recursive = true;
      };
    };
  };
}
