{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.sway;
in
{

  options = {
    modules.sway.enable = mkEnableOption "swaywm configuration";
  };

  config = mkIf cfg.enable {

    programs.xwayland.enable = true;

    modules = {
      xdg.enable = true;
      pipewire.enable = true;
      zathura.enable = true;
      qutebrowser.enable = true;
      mpv.enable = true;
      i3-status-rust.enable = false;
      waybar.enable = true;
      mpd.enable = true;
    };

    services.dbus.enable = true;
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = false;
    };

    fonts.fonts = with pkgs; [ ubuntu_font_family ];

    hm.home.packages = with pkgs; [
      mako
      foot
      #waybar
      #zathura
      #qutebrowser
      #neovim
      #mpv
      #i3status-rust
      firefox-wayland
      #mpd
      swaylock
      swayidle
      bemenu
      wev
      bashmount
      libnotify
      #waypipe
      wl-clipboard
      clipman
      grim
      slurp
      wf-recorder
      swappy
      material-design-icons
      font-awesome
      #nerdfonts
      pulsemixer
      pamixer
      imv
      mpc_cli
      xdg-utils
      pass-wayland
    ];

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      gtkUsePortal = false; # otherwise the file chooser don't show up
    };

    ### greeter
    users.users.greeter.group = "greeter";
    users.groups.greeter = { };
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
    ###

    ### themes
    hm.gtk = {
      enable = true;
      iconTheme = {
        name = "ePapirus";
        package = pkgs.papirus-icon-theme;
      };
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
    hm.qt = {
      enable = true;
      platformTheme = "gtk";
      style.name = "Adwaita-dark";
      style.package = pkgs.adwaita-qt;
    };
    ###

    ### scripts
    environment.localBinInPath = true;
    hm.home.file.".local/bin" = {
      source = ./../../bin/scripts;
      recursive = true;
    };

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
