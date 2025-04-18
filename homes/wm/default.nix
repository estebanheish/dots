{
  pkgs,
  user,
  ...
}: {
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.05";
  imports = [
    ../../modules/home-manager/yazi
    ../../modules/home-manager/nushell
    ../../modules/home-manager/helix
    ../../modules/home-manager/direnv
    ../../modules/home-manager/broot

    ../../modules/home-manager/hyprland
  ];
  home.packages = with pkgs; [zoxide];
  programs.home-manager.enable = true;
}
