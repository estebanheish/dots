{config, ...}: {
  flake.nixosModules.broot = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = [pkgs.broot];

      programs.nushell.extraConfig = ''
        source ${
          pkgs.runCommand "broot-nushell-integration.nu"
          {nativeBuildInputs = [pkgs.broot];}
          ''
            broot --print-shell-function nushell \
              | sed 's/export def --env main/export def --env br/' \
              > "$out"
          ''
        }
      '';

      xdg.configFile."broot" = {
        source = ../../configs/broot;
        recursive = true;
      };
    };
  };
}
