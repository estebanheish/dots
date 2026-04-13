{config, ...}: {
  flake.nixosModules.audiobookshelf = {pkgs, ...}: {
    services.audiobookshelf = {
      enable = true;
      port = 1778;
      host = "0.0.0.0";
      openFirewall = true;
    };
    fileSystems."/var/lib/audiobookshelf/audiobooks" = {
      device = "/home/${config.username}/Documents/audiolibros";
      options = ["bind" "ro"];
      fsType = "auto";
    };
    home-manager.users.${config.username} = {
      xdg.desktopEntries.audiobookshelf = {
        name = "audiobookshelf WebUI";
        exec = "xdg-open http://localhost:1778";
        terminal = false;
        icon = "${pkgs.audiobookshelf}/opt/client/dist/icon.svg";
      };
    };
  };
}
