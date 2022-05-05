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

    users.users.${config.user.name} = {
      isNormalUser = true;
      createHome = true;
      initialPassword = "hola";
      extraGroups = [ "wheel" ];
    };

    time.timeZone = "Europe/Madrid";
    system.stateVersion = "21.11";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "colemak";

    nix = {
      settings.allowed-users = [ "@wheel" "heis" ];
      gc.automatic = true;
      extraOptions = "experimental-features = nix-command flakes";
    };

  };
}
