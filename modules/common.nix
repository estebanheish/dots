{ config, pkgs, lib, ... }:
with lib;
let
  user = builtins.getEnv "USER";
  name = if builtins.elem user [ "" "root" ] then "heis" else user;
in
{
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" name ])
  ];

  options = {

    user = mkOption {
      type = types.attrsOf types.str;
    };

  };

  config = {

    user.name = name;
    time.timeZone = "Europe/Madrid";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "colemak";
    system.stateVersion = "23.05";
    hm.home.stateVersion = "23.05";

    modules = {
      packages.core.enable = true;
      zsh.enable = true;
      nushell.enable = true;
      lf.enable = true;
      broot.enable = true;
      neovim.enable = true;
      git.enable = true;
    };

    users.users.${config.user.name} = {
      isNormalUser = true;
      createHome = true;
      initialPassword = "hola";
      shell = pkgs.nushell;
      extraGroups = [ "wheel" "audio" "video" ];
    };

    nixpkgs.config.allowUnfree = true;
    nix = {
      settings.allowed-users = [ "@wheel" "heis" ];
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

  };
}
