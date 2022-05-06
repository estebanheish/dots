{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.core.packages;
in
{

  options = {
    modules.core.packages.enable = mkEnableOption "core packages";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      # editors
      neovim 

      # downloads
      wget yt-dlp

      # audio
      alsaUtils

      # Archives
      unzip unrar gnutar

      # File Sync
      rsync rclone

      # Video/Audio processing
      ffmpeg imagemagick

      # basic utils
      pciutils usbutils
      killall 
      bc
      git
      fzf
      tree
      file 
      tmate

      # Modern UNIX utitlities
      bat            # cat
      delta          # syntax-highlighting pager for git, diff and grep output
      duf            # df
      fd             # find
      ripgrep        # grep
      procs          # ps
      choose         # cut / awk
      bottom         # htop / top
      hyperfine      # time
      xh             # curl
      dog            # dig
      sd             # sed
      jq             # sed for json data
    ];
    
  };

}
