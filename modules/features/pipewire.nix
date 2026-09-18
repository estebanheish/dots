{...}: {
  flake.nixosModules.pipewire = {pkgs, ...}: {
    # rtkit is optional but recommended
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
        extraConfig."10-bluetooth-audio" = {
          "wireplumber.settings" = {
            # Keep earbuds in high-quality A2DP mode. Select the headset
            # profile manually in Wiremix when their microphone is needed.
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
        };
      };
    };
    environment.systemPackages = with pkgs; [
      alsa-utils
    ];
  };
}
