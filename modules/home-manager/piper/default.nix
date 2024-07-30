{pkgs, ...}: {
  home.packages = [pkgs.piper-tts];
  xdg.configFile."piper/models".source = ./models;
}
