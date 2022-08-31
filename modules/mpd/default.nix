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
      musicDirectory = "/home/${config.user.name}/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
    hm.home.packages = with pkgs; [ ncmpcpp mpc_cli ];
  };

}
