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
      # "media.autoplay.default" = "0";
    };
    profiles.default.bookmarks = {
      force = true;
      settings = [
        {
          name = "Syncthing";
          url = "http://localhost:8384/";
          keyword = "syncthing";
        }
        {
          name = "Audiobookshelf";
          url = "http://localhost:1778/";
          keyword = "audiobookshelf";
        }
        {
          name = "Llamaswap";
          url = "http://localhost:11344/";
          keyword = "llamaswap";
        }
      ];
    };
  };
}
