{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.pipewire;
in
{

  options = {
    modules.pipewire.enable = mkEnableOption "pipewire";
  };

  config = mkIf cfg.enable {
    # rtkit is optional but recommended
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
      pulsemixer
      alsaUtils
    ];

  };

}
