{ config, lib, home-manager, ... }:
with lib;
let 
  cfg = config.modules.xdg;
in
{

  options = {
    modules.xdg.enable = mkEnableOption "xdg";
  };

  config = mkIf cfg.enable {
    ### A tidy $HOME is a tidy mind
    hm.xdg.enable = true;

    environment = {
      sessionVariables = {
        # These are the defaults, and xdg.enable does set them, but due to load
        # order, they're not set before environment.variables are set, which could
        # cause race conditions.
        XDG_CACHE_HOME  = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME   = "$HOME/.local/share";
        XDG_BIN_HOME    = "$HOME/.local/bin";
      };
      variables = {
      };
    };

    xdg = {
      mime.enable = true;
      mime.defaultApplications = 
      let 
        text = "nvim";
        file = "lf";
        img = "imv";
        pdf = "org.pwmt.zathura";
        torrent = "qbittorrent";
        browser = "org.qutebrowser.qutebrowser";
      in
      {
        # Text
        "text/plain" = [ "${text}.desktop" ];
        "text/x-shellscript" = [ "${text}.desktop" ];

        # Directory
        "inode/directory" = [ "${file}.desktop" "nautilus.desktop" ];

        # Urls
        "text/html" = [ "${browser}.desktop" ];
        "text/xml" = [ "${browser}.desktop" ];
        "x-scheme-handler/http" = [ "${browser}.desktop" ];
        "x-scheme-handler/https" = [ "${browser}.desktop" ];
        "x-scheme-handler/ftp" = [ "${browser}.desktop" ];

        # Video
        "video/x-matroska" = [ "mpv.desktop" ];
        "video/mp4" = [ "mpv.desktop" ];
        "video/mpeg" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
        "video/ogg" = [ "mpv.desktop" ];
        "video/webp" = [ "mpv.desktop" ];
        "video/mp2t" = [ "mpv.desktop" ];
        "video/3gpp" = [ "mpv.desktop" ];
        "video/3gpp2" = [ "mpv.desktop" ];
        "video/x-msvideo" = [ "mpv.desktop" ];

        # Audio 
        "audio/aac" = [ "mpv.desktop" ];
        "audio/mpeg" = [ "mpv.desktop" ];
        "audio/ogg" = [ "mpv.desktop" ];
        "audio/opus" = [ "mpv.desktop" ];
        "audio/wav" = [ "mpv.desktop" ];
        "audio/webm" = [ "mpv.desktop" ];
        "audio/3gpp" = [ "mpv.desktop" ];
        "audio/3gpp2" = [ "mpv.desktop" ];

        # Images
        "image/png" = [ "${img}.desktop" ];
        "image/jpeg" = [ "${img}.desktop" ];
        "image/gif" = [ "${img}.desktop" ];
        "image/svg+xml" = [ "${img}.desktop" ];
        "image/tiff" = [ "${img}.desktop" ];

        # Documents
        "application/pdf" = [ "${pdf}.desktop" "${browser}.desktop" ];
        "application/epub+zip" = [ "${pdf}.desktop" ];
        "application/postscript" = [ "${pdf}.desktop" ];

        # Torrents
        "x-scheme-handler/magnet" = [ "${torrent}.desktop" ];
        "application/x-bittorrent" = [ "${torrent}.desktop" ];
        };
    };
  };

}
