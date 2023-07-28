{
  pkgs,
  user,
  ...
}: {
  environment.localBinInPath = true;
  security.pam.services.swaylock = {};
  # programs.xwayland.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    nvidiaPatches = true;
  };

  imports = [../../../modules/nixos/firefox];
  home-manager.users.${user}.imports = [../../../modules/home-manager/hyprland];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
      initial_session = {
        command = "Hyprland";
        user = user;
      };
    };
  };
}