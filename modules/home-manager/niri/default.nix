{
  pkgs,
  config,
  lib,
  ...
}: let
  l = import ../lib {inherit config;};
  inherit (l) linkFile linkDir;
  cfg = config.dots.niri;
in {
  options.dots.niri.profile = lib.mkOption {
    type = lib.types.enum ["simple" "dms"];
    default = "simple";
  };

  imports = [
    ../librewolf
    ../mpv
    ../zathura
    ../foot
  ];

  config = lib.mkMerge [
    {
      home.packages = with pkgs; [
        monaspace
        wev
        imv
        satty
        pwvucontrol
        blueman
        impala
        bluetui
        fyi
        # rofi
        xwayland-satellite
        nautilus
      ];

      programs.vicinae = {
        enable = true;
        systemd = {
          enable = true;
          autoStart = true;
        };
      };

      xdg.configFile = {
        "niri/config.kdl".source = linkFile "niri/config.kdl";
      };

      home.file = lib.mkMerge [
        {
          "bin" = {
            enable = true;
            source = ../../../bin;
            target = ".local/bin";
            recursive = true;
            executable = true;
          };
        }
      ];
    }

    (lib.mkIf (cfg.profile == "simple") {
      home.packages = with pkgs; [
        swaybg
        brightnessctl
        playerctl
        wl-clipboard
        ncpamixer
      ];

      services.swayidle = {
        enable = true;
        timeouts = [
          {
            timeout = 600;
            command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
          }
          {
            timeout = 650;
            command = "${pkgs.swaylock}/bin/swaylock -f";
          }
        ];
        events = [
          {
            event = "before-sleep";
            command = "${pkgs.swaylock}/bin/swaylock -f";
          }
        ];
      };

      services = {
        mako.enable = true;
        polkit-gnome.enable = true;
        cliphist.enable = true;
      };

      programs.swaylock.enable = true;

      home.file.".wall.jpg".source = ../../../misc/walls/moon.jpg;

      xdg.configFile = {
        "mako" = linkDir "mako";
        "swaylock" = linkDir "swaylock";
        "niri/profile.kdl".source = linkFile "niri/simple.kdl";
      };

      dconf.settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };

      gtk = {
        enable = true;
        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };

      qt = {
        enable = true;
        platformTheme.name = "adwaita";
        style = {
          package = pkgs.adwaita-qt;
          name = "adwaita-dark";
        };
      };
    })

    (lib.mkIf (cfg.profile == "dms") {
      services = {
        polkit-gnome.enable = true;
      };
      home.packages = with pkgs; [kdePackages.qt6ct adw-gtk3];
      gtk = {
        enable = true;
        theme = {
          name = "Adwaita-Dark";
          package = pkgs.gnome-themes-extra;
        };
      };
      xdg.configFile = {
        "matugen" = linkDir "matugen";
        # "foot/theme.ini".text = "include=~/.config/foot/dank-colors.ini";
        # "foot/theme.ini".source = linkFile "foot/themes/github_dark.ini";
        "niri/profile.kdl".source = linkFile "niri/dms.kdl";
      };
    })
  ];
}
