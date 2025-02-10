{pkgs, ...}: {
  home.packages = with pkgs; [
    wget
    parted
    killall
    git
    file
    tmate
    pkgs.master.zoxide # TODO
    duf
    du-dust
    fd
    ripgrep
    bottom
    tealdeer
  ];
}
