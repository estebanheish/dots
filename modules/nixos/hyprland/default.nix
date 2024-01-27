{
  pkgs,
  user,
  inputs,
  ...
}: {
  environment.localBinInPath = true;
  security.pam.services.swaylock = {};
  # programs.xwayland.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
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
