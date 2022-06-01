{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.river;
in
{
  options = {
    modules.river.enable = mkEnableOption "river";
  };

  config = {

    hardware.opengl.enable = true;
    security.polkit.enable = true;
    security.pam.services.swaylock = { };
    # programs.dconf.enable = true;
    # programs.xwayland.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
    };

    modules = {
      pipewire.enable = true;
      kanshi.enable = true;
      foot.enable = true;
      yambar.enable = true;
      qutebrowser.enable = true;
      mako.enable = true;
      mpv.enable = true;
      xdg.enable = true;
      zathura.enable = true;
    };

    environment.systemPackages = with pkgs; [
      river
      rivercarro
      foot
      bemenu
      wlr-randr
      firefox-wayland
      kanshi
      grim
      slurp
      playerctl
      wl-clipboard
      imv
      swaybg
      xdg-utils
      swayidle
      swaylock
      bashmount
    ];

    environment.sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us(colemak)";
    };

    hm.xdg.configFile = {
      "river" = {
        source = ./../../config/river;
        recursive = true;
      };
      "wall".source = ./../../bin/pix/houseonthesideofalake.jpg;
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd river";
          user = "greeter";
        };
      };
    };

  };
}


