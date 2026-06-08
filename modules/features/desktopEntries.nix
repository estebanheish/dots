{config, ...}: {
  flake.nixosModules.desktopEntries = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      xdg.desktopEntries = {
        rpi-audiobookshelf = {
          name = "rpi audiobookshelf WebUI";
          exec = "xdg-open http://192.168.18.6:1778";
          terminal = false;
          icon = "${pkgs.audiobookshelf}/opt/client/dist/icon.svg";
        };
        rpi-qbittorrent = {
          name = "rpi qbittorrent WebUI";
          exec = "xdg-open http://192.168.18.6:8080";
          terminal = false;
        };
        pihole = {
          name = "Pi-hole WebUI";
          exec = "xdg-open http://192.168.18.7/admin";
          terminal = false;
        };
      };
    };
  };
}
