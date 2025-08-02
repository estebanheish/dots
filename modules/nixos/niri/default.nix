{
  user,
  pkgs,
  ...
}: {
  environment.localBinInPath = true;

  programs.niri.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};

  home-manager.users.${user} = {
    imports = [
      ../../../modules/home-manager/niri
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.logind = {
    extraConfig = ''
      IdleActionSec=60m
    '';
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=2h
  '';

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = "greeter";
      };
      initial_session = {
        command = "niri-session";
        inherit user;
      };
    };
  };
}
