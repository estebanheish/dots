{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.packages.core;
in {
  options = {
    modules.packages.core.enable = mkEnableOption "core packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # editors
      # neovim

      # downloads
      wget
      yt-dlp
      ytmdl
      transmission
      gallery-dl

      # archives
      unzip
      unrar
      gnutar

      # file sync
      rsync
      sshfs

      # video/audio processing
      ffmpeg
      imagemagick

      # basic utils
      tmux
      pciutils
      usbutils
      parted
      killall
      bc
      git
      fzf
      tree
      file
      tmate
      mediainfo
      efibootmgr

      # Modern UNIX utitlities
      bat # cat
      delta # syntax-highlighting pager for git, diff and grep output
      duf # df
      fd # find
      ripgrep # grep
      procs # ps
      choose # cut / awk
      bottom # htop / top
      hyperfine # time
      xh # curl
      dog # dig
      sd # sed
      jq # sed for json data
    ];
  };
}
