{
  self,
  inputs,
  config,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.niri = moduleWithSystem ({inputs', ...}: nixosConfig @ {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
      inputs.noctalia.nixosModules.default
      self.nixosModules.i2c
      self.nixosModules.foot
      self.nixosModules.desktopApps
      self.nixosModules.desktopEntries
      self.nixosModules.binsInPath
      self.nixosModules.hunspell
      self.nixosModules.adwaita-dark
    ];

    programs.niri.enable = true;
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;

    environment.shells = with pkgs; [nushell];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services.logind.settings.Login = {
      IdleActionSec = "60m";
      # HandlePowerKey = "poweroff";
      # HandlePowerKeyLongPress = "poweroff";
    };

    systemd.sleep.settings.Sleep = {
      HibernateDelaySec = "2h";
    };

    home-manager.users.${config.username} = {config, ...}: {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      home.packages = with pkgs; [
        wl-clipboard
        monaspace
        wev
        imv
        pwvucontrol
        nautilus
        bluetui
        wiremix
      ];

      programs.noctalia = {
        enable = true;
        settings = ../../configs/noctalia/config.toml;
        checkConfig = true;
      };

      xdg.configFile = {
        "niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri/config.kdl";
        "niri/profile.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri/${nixosConfig.config.networking.hostName}.kdl";
        "niri/extra_rules.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri/extra_rules.kdl";
      };
    };

    services.displayManager.noctalia-greeter = {
      enable = true;
      settings = {
        keyboard = {
          layout = "us";
          variant = "colemak";
        };
      };
    };

    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      recommendedServices.enable = true;
    };
  });
}
