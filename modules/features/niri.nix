{
  self,
  config,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.niri = moduleWithSystem ({inputs', ...}: {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.i2c
      self.nixosModules.foot
      self.nixosModules.vicinae
      self.nixosModules.desktopApps
      self.nixosModules.binsInPath
      self.nixosModules.hunspell
    ];

    programs.niri.enable = true;
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;

    environment.shells = with pkgs; [nushell];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user = config.username;
        };
        initial_session = {
          command = "niri-session";
          user = config.username;
        };
      };
    };

    services.logind.settings.Login = {
      IdleActionSec = "60m";
    };

    systemd.sleep.settings.Sleep = {
      HibernateDelaySec = "2h";
    };

    home-manager.users.${config.username} = {config, ...}: {
      home.packages = with pkgs; [
        brightnessctl
        playerctl
        wl-clipboard
        # rofi
        monaspace
        wev
        imv
        satty
        pwvucontrol
        xwayland-satellite
        nautilus
        # blueman
        # impala
        # bluetui
        wiremix
        fyi
        inputs'.noctalia.packages.default
      ];

      services = {
        polkit-gnome.enable = true;
        cliphist.enable = true;
      };

      xdg.configFile = {
        "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri/config.kdl";
        "niri/profile.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri/clank.kdl";
        "niri/extra_rules.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri/extra_rules.kdl";
      };
    };
  });
}
