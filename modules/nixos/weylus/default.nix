{pkgs, ...}: {
  programs.weylus = {
    enable = true;
    openFirewall = true;
    package = pkgs.master.weylus;
  };
}
