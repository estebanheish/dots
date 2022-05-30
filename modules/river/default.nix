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
    modules = {
      pipewire.enable = true;
      kanshi.enable = true;
      foot.enable = true;
      yambar.enable = true;
      qutebrowser.enable = true;
      mako.enable = true;
      mpv.enable = true;
    };

    environment.systemPackages = with pkgs; [
      river
      foot
      bemenu
      wlr-randr
      firefox
      kanshi
      grim
      slurp
      playerctl
      wl-clipboard
      imv
      swaybg
      xdg-utils
    ];

    environment.sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us(colemak)";
    };

    hm.xdg.configFile = {
      "river" = {
        source = ./../../config/river;
        recursive = true;
      };
      "wall".source = ./../../bin/pix/naturaleza/christina-deravedisian-planta-rosa.jpg;
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


