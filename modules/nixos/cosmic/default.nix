{
  # inputs,
  user,
  pkgs,
  ...
}: {
  imports = [
    # inputs.nixos-cosmic.nixosModules.default
  ];
  environment.localBinInPath = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  home-manager.users.${user} = {
    imports = [
      ../../home-manager/librewolf
      ../../home-manager/mpv
      ../../home-manager/ghostty
      ../../home-manager/zathura
      ({config, ...}: {
        xdg.configFile."cosmic" = {
          recursive = true;
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/cosmic";
        };
      })
    ];
    home.file."bin" = {
      enable = true;
      source = ../../../bin;
      target = ".local/bin";
      recursive = true;
      executable = true;
    };
    # services.cliphist.enable = true;
    # home.packages = with pkgs; [
    #   kooha
    #   wl-clipboard
    # ];
  };
}
