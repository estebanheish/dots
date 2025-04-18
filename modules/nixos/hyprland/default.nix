{
  pkgs,
  user,
  # inputs,
  ...
}: {
  environment.localBinInPath = true;

  # authentication agent
  # security.polkit.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = false;
  };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [pkgs.xdg-desktop-portal-gtk];
  #   xdgOpenUsePortal = true;
  # };

  home-manager.users.${user}.imports = [
    ../../../modules/home-manager/hyprland
    ../../../modules/home-manager/librewolf
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        inherit user;
      };
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        inherit user;
      };
    };
  };
}
