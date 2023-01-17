{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.mpd;
in {
  options = {
    modules.mpd.enable = mkEnableOption "mdp";
  };

  config = mkIf cfg.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/${user}/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
    home.packages = with pkgs; [ncmpcpp mpc_cli];
  };
}
