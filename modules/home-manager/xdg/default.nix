{...}: {
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = let
        text = "helix";
        file = "lf";
        img = "imv";
        pdf = "org.pwmt.zathura";
        torrent = "transmission";
        browser = "firefox-esr";
      in {
        # Text
        "text/plain" = ["${text}.desktop"];
        "text/x-shellscript" = ["${text}.desktop"];

        # Directory
        "inode/directory" = ["${file}.desktop" "nautilus.desktop"];

        # Urls
        "text/html" = ["${browser}.desktop"];
        "text/xml" = ["${browser}.desktop"];
        "x-scheme-handler/http" = ["${browser}.desktop"];
        "x-scheme-handler/https" = ["${browser}.desktop"];
        "x-scheme-handler/ftp" = ["${browser}.desktop"];

        # Video
        "video/x-matroska" = ["mpv.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/mpeg" = ["mpv.desktop"];
        "video/webm" = ["mpv.desktop"];
        "video/ogg" = ["mpv.desktop"];
        "video/webp" = ["mpv.desktop"];
        "video/mp2t" = ["mpv.desktop"];
        "video/3gpp" = ["mpv.desktop"];
        "video/3gpp2" = ["mpv.desktop"];
        "video/x-msvideo" = ["mpv.desktop"];

        # Audio
        "audio/aac" = ["mpv.desktop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/ogg" = ["mpv.desktop"];
        "audio/opus" = ["mpv.desktop"];
        "audio/wav" = ["mpv.desktop"];
        "audio/webm" = ["mpv.desktop"];
        "audio/3gpp" = ["mpv.desktop"];
        "audio/3gpp2" = ["mpv.desktop"];

        # Images
        "image/png" = ["${img}.desktop"];
        "image/jpeg" = ["${img}.desktop"];
        "image/gif" = ["${img}.desktop"];
        "image/svg+xml" = ["${img}.desktop"];
        "image/tiff" = ["${img}.desktop"];

        # Documents
        "application/pdf" = ["${pdf}.desktop" "${browser}.desktop"];
        "application/epub+zip" = ["${pdf}.desktop"];
        "application/postscript" = ["${pdf}.desktop"];

        # Torrents
        "x-scheme-handler/magnet" = ["${torrent}.desktop"];
        "application/x-bittorrent" = ["${torrent}.desktop"];
      };
    };
    desktopEntries = {
      helix = {
        name = "helix";
        exec = "ghostty -e hx %u";
      };
    };
  };
}
