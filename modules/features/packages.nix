{
  self,
  config,
  ...
}: {
  flake.homeModules.cli = {
    pkgs,
    lib,
    ...
  }: let
    linuxOnly = lib.optionals pkgs.stdenv.hostPlatform.isLinux;
  in {
    home.packages = with pkgs;
      [
        # Files and navigation
        file
        fd
        ripgrep
        bat
        tree

        # Storage and system inspection
        duf
        dust
        bottom
      ]
      ++ linuxOnly [
        nethogs
        parted
        pciutils
        usbutils
        efibootmgr
      ]
      ++ [
        # Transfer and remote access
        rsync
      ]
      # Needs macFUSE on macOS.
      ++ linuxOnly [sshfs]
      ++ [
        wget

        # Archives
        ouch

        # Media
        ffmpeg
        imagemagick
        mediainfo

        # Interactive utilities
        tealdeer
        hyperfine
        xh
        jless
        lazygit
        libqalculate
        # (libqalculate.override {gnuplot = gnuplot_qt;})
      ]
      # Brings all of Qt: too big for conqi's disk.
      ++ linuxOnly [gnuplot_qt]
      ++ [caligula];
  };

  flake.nixosModules = {
    cli = {
      home-manager.users.${config.username}.imports = [self.homeModules.cli];
    };

    downloaders = {pkgs, ...}: {
      home-manager.users.${config.username}.home.packages = with pkgs; [
        yt-dlp
        gallery-dl
      ];
    };

    development = {pkgs, ...}: {
      home-manager.users.${config.username}.home.packages = with pkgs; [
        jujutsu
        nixd
        alejandra
        taplo
        lua-language-server

        rust-analyzer
        basedpyright
        ruff
        vtsls
        vscode-langservers-extracted
        svelte-language-server
      ];
    };
  };
}
