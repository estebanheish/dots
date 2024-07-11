{pkgs, ...}: {
  home.packages = with pkgs; [
    yt-dlp
    # ytmdl
    # transmission_4 TODO
    gallery-dl
  ];
}
