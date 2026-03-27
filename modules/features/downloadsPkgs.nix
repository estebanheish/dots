{config, ...}: {
  flake.nixosModules.downloadsPkgs = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        yt-dlp
        # ytmdl
        # transmission_4
        gallery-dl
      ];
    };
  };
}
