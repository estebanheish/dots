{...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.downloads" = false;
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "middlemouse.paste" = false;
      "general.autoScroll" = true;
      "media.autoplay.default" = "0";
    };
  };
}
