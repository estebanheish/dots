{pkgs, ...}: {
  home.packages = with pkgs; [
    yt-dlp
    ytmdl
    transmission
    gallery-dl
  ];
}
