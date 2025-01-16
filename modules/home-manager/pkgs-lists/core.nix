{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    parted
    killall
    git
    file
    tmate
    zoxide
    duf
    du-dust
    fd
    ripgrep
    bottom
    tealdeer
  ];
}
