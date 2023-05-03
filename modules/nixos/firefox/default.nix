{...}: {
  programs.firefox = {
    enable = true;
    preferences = {
      "gfx.webrender.enabled" = true;
      "gfx.webrender.all" = true;
      "media.ffmpeg.vaapi.enabled" = true;
    };
  };
}
