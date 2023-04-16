{
  config,
  pkgs,
  lib,
  user,
  ...
}:
with lib; {
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";
  # console.keyMap = "us";
  system.stateVersion = "23.05";

  modules = {
    zsh.enable = true;
  };

  home-manager.users.${user}.modules = {
    packages.core.enable = true;
    nushell.enable = true;
    lf.enable = true;
    broot.enable = true;
    helix.enable = true;
    git.enable = true;
  };

  users.users.${user} = {
    isNormalUser = true;
    createHome = true;
    initialPassword = "hola";
    shell = pkgs.nushell;
    extraGroups = ["wheel" "audio" "video"];
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.allowed-users = ["@wheel" "${user}"];
    gc.automatic = true;
    optimise.automatic = true;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # doas instead of sudo
  security = {
    doas = {
      enable = true;
      extraConfig = "permit nopass :wheel";
    };
    sudo.enable = false;
  };

  environment.systemPackages = with pkgs; [git];
}
