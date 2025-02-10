{
  pkgs,
  user,
  ...
}: {
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";
  imports = [
    ../../modules/home-manager/yazi
    ../../modules/home-manager/nushell
    ../../modules/home-manager/helix
    ../../modules/home-manager/direnv
    ../../modules/home-manager/broot
  ];
  home.packages = with pkgs; [zoxide];
  programs.home-manager.enable = true;
}
