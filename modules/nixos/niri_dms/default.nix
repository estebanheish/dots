{
  user,
  inputs,
  ...
}: {
  environment.localBinInPath = true;

  programs.niri.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};

  home-manager.users.${user} = {
    imports = [
      ../../../modules/home-manager/niri_dms
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.logind.settings.Login = {
    IdleActionSec = "60m";
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=2h
  '';

  imports = [
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/${user}";
  };
}
