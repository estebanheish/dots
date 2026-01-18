{
  user,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.dots.niri;
in {
  options.dots.niri.profile = lib.mkOption {
    type = lib.types.enum ["simple" "dms"];
    default = "simple";
  };

  imports = [
    ../i2c
  ];

  config = lib.mkMerge [
    {
      environment.localBinInPath = true;
      programs.niri.enable = true;
      services.upower.enable = true;
      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;

      environment.shells = with pkgs; [nushell];

      home-manager.users.${user} = {
        imports = [../../../modules/home-manager/niri];
        dots.niri.profile = cfg.profile;
      };

      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      services.logind.settings.Login = {
        IdleActionSec = "60m";
      };

      systemd.sleep.extraConfig = ''
        HibernateDelaySec=2h
      '';
    }

    (lib.mkIf (cfg.profile == "simple") {
      security.pam.services.swaylock = {};
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
            user = "greeter";
          };
          initial_session = {
            command = "niri-session";
            inherit user;
          };
        };
      };
    })

    (lib.mkIf (cfg.profile == "dms") {
      programs.dms-shell = {
        enable = true;

        systemd = {
          enable = true; # Systemd service for auto-start
          restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
        };

        # Core features
        enableSystemMonitoring = true; # System monitoring widgets (dgop)
        enableVPN = false; # VPN management widget
        enableDynamicTheming = true; # Wallpaper-based theming (matugen)
        enableAudioWavelength = true; # Audio visualizer (cava)
        enableCalendarEvents = true; # Calendar integration (khal)
      };

      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/${user}";
      };
    })
  ];
}
