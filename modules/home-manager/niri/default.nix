{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.dots.niri;
  dotConfigs = "${config.home.homeDirectory}/.dots/configs";
  linkFile = rel: config.lib.file.mkOutOfStoreSymlink "${dotConfigs}/${rel}";
  linkDir = rel: {
    source = config.lib.file.mkOutOfStoreSymlink "${dotConfigs}/${rel}";
    recursive = true;
  };
in {
  options.dots.niri.profile = lib.mkOption {
    type = lib.types.enum ["simple" "dms"];
    default = "simple";
  };

  imports = [
    ../librewolf
    ../mpv
    ../zathura
    inputs.dankMaterialShell.homeModules.dank-material-shell
  ];

  config = lib.mkMerge [
    {
      home.packages = with pkgs; [
        monaspace
        wev
        imv
        satty
        swaybg
        pwvucontrol
        blueman
        impala
        bluetui
        rofi
        foot
        fyi
        xwayland-satellite
        nautilus
        wl-clipboard
      ];

      services = {
        mako.enable = true;
        polkit-gnome.enable = true;
        cliphist.enable = true;
      };

      xdg.configFile = {
        "niri/base.kdl".source = linkFile "niri/base.kdl";
        "niri/profiles/simple.kdl".source = linkFile "niri/profiles/simple.kdl";
        "niri/profiles/dms.kdl".source = linkFile "niri/profiles/dms.kdl";
        # "niri/dms" = linkDir "niri/dms";
        "foot/foot.ini".source = linkFile "foot/foot.ini";
        "rofi" = linkDir "rofi";
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
        (
          let
            profilePath = "${dotConfigs}/niri/profiles/${cfg.profile}.kdl";
            targetKey = ".config/niri/config.kdl";
          in
            if builtins.pathExists profilePath
            then {
              "${targetKey}".source = config.lib.file.mkOutOfStoreSymlink profilePath;
            }
            else {
              "${targetKey}".text = ''include "profiles/${cfg.profile}.kdl"'';
            }
        )
        (lib.mkIf (cfg.profile == "simple") {
          ".wall.jpg".source = ../../../misc/walls/moon.jpg;
        })
      ];
    }

    (lib.mkIf (cfg.profile == "simple") {
      home.packages = with pkgs; [
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

      programs.swaylock.enable = true;

      xdg.configFile = {
        "mako" = linkDir "mako";
        "swaylock" = linkDir "swaylock";
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
      gtk = {
        enable = true;
        theme = {
          name = "Adwaita-Dark";
          package = pkgs.gnome-themes-extra;
        };
      };
      home.packages = [pkgs.kdePackages.qt6ct];
      xdg.configFile = {
        "matugen" = linkDir "matugen";
      };
      programs.dankMaterialShell = {
        quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
        enable = true;
        systemd.enable = true;
        enableVPN = false;
      };
    })
  ];
}
