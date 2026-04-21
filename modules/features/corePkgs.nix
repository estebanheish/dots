{config, ...}: {
  flake.nixosModules.corePkgs = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        rsync
        sshfs
        wget
        parted
        killall
        git
        file
        tmate
        duf
        dust
        fd
        ripgrep
        bottom
        tealdeer
      ];
    };
  };
}
