{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    preferences = {
      "gfx.webrender.enabled" = true;
      "gfx.webrender.all" = true;
      "media.ffmpeg.vaapi.enabled" = true;
    };
    package = pkgs.firefox.override {extraNativeMessagingHosts = [inputs.pipewire-screenaudio.packages.${pkgs.system}.default];};
  };
}
