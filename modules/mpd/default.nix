{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.mpd;
in
{

  options = {
    modules.mpd.enable = mkEnableOption "mdp";
  };

  config = mkIf cfg.enable {
    hm.services.mpd = {
      enable = true;
      musicDirectory = "$HOME/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
  };

}
