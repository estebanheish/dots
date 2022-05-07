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

    modules = {
      zathura.enable = true;
      qutebrowser.enable = true;
      neovim.enable = true;
      mpv.enable = true;
      i3-status-rust = true;
    };

    programs.sway = {
      enable = true;
      extraPackages = with pkgs; [
        mako
        #waybar
        foot
        zathura
        #qutebrowser
        #neovim
        #mpv
        mpd
        swaylock
        swayidle
        bemenu
        wev
        bashmount
        autotiling
        libnotify
        waypipe
        wl-clipboard
        clipman
        grim slurp wf-recorder swappy
        pulsemixer pamixer
        material-design-icons font-awesome
        imv mpc_cli
        pass-wayland
      ];
    };
    
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
      "foot" = {
        source = ./../../config/foot;
        recursive = true;
      };
      "mako" = {
        source = ./../../config/mako;
        recursive = true;
      };
    };

  };

}
