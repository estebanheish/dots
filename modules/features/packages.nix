{config, ...}: {
  flake.nixosModules = {
    cli = {pkgs, ...}: {
      home-manager.users.${config.username}.home.packages = with pkgs; [
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
        nethogs
        parted
        pciutils
        usbutils
        efibootmgr

        # Transfer and remote access
        rsync
        sshfs
        wget
        tmate

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
        gnuplot_qt
        caligula
      ];
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
