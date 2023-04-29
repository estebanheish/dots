{
  pkgs,
  user,
  ...
}: {
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
}
