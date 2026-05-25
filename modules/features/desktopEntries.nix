{config, ...}: {
  flake.nixosModules.desktopEntries = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      xdg.desktopEntries = {
        rpi-audiobookshelf = {
          name = "audiobookshelf WebUI";
          exec = "xdg-open http://192.168.18.6:1778";
          terminal = false;
          icon = "${pkgs.audiobookshelf}/opt/client/dist/icon.svg";
        };
        rpi-qbittorrent = {
          name = "qbittorrent WebUI";
          exec = "xdg-open http://192.168.18.6:8080";
          terminal = false;
        };
      };
    };
  };
}
