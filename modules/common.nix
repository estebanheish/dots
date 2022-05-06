{ config, pkgs, lib, ... }:
with lib;
let 
  user = builtins.getEnv "USER";
  name = if builtins.elem user [ "" "root" ] then "heis" else user;
in {
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

    modules = {
      core.packages.enable = true;
      zsh.enable = true;
      lf.enable = true;
      broot.enable = true;
    };

    users.users.${config.user.name} = {
      isNormalUser = true;
      createHome = true;
      initialPassword = "hola";
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "audio" "video" "networkmanager" "libvirt" ];
    };

    time.timeZone = "Europe/Madrid";
    system.stateVersion = "21.11";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "colemak";

    nixpkgs.config.allowUnfree = true;
    nix = {
      settings.allowed-users = [ "@wheel" "heis" ];
      gc.automatic = true;
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
