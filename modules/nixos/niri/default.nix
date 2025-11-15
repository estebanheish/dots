{
  user,
  pkgs,
  lib,
  inputs,
  config,
  ...
}: let
  cfg = config.dots.niri;
  system = pkgs.stdenv.hostPlatform.system;
in {
  options.dots.niri.profile = lib.mkOption {
    type = lib.types.enum ["simple" "dms"];
    default = "simple";
  };

  imports = [
    ../i2c
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  config = lib.mkMerge [
    {
      environment.localBinInPath = true;

      programs.niri.enable = true;

      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;
      services.upower.enable = true;
      security.pam.services.swaylock = {};

      home-manager.users.${user} = {
        imports = [
          ../../../modules/home-manager/niri
        ];
        dots.niri.profile = cfg.profile;
      };

      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      services.logind.settings.Login = {
        IdleActionSec = "60m";
      };

      systemd.sleep.extraConfig = ''
        HibernateDelaySec=2h
      '';

      programs.niri.package = lib.mkForce (
        inputs.niri.packages.${system}.niri.overrideAttrs (_: {doCheck = false;})
      );
    }

    (lib.mkIf (cfg.profile == "simple") {
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
      programs.dankMaterialShell.greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/${user}";
      };
    })
  ];
}
