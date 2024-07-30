{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    parted
    killall
    git
    file
    tmate
    zoxide
    bat
    delta
    duf
    du-dust
    fd
    ripgrep
    procs
    bottom
    tealdeer
  ];
}
