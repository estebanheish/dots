{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.xmonad;
in {
  options = {
    modules.xmonad.enable = mkEnableOption "xmonad";
  };

  config = mkIf cfg.enable {
    modules = {
      pipewire.enable = true;
    };

    home-manager.users.${user}.modules = {
      dunst.enable = true;
      xdg.enable = true;
      alacritty.enable = true;
    };

    hardware.opengl.enable = true;
    services.xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        enableConfiguredRecompile = true;
        #config = builtins.readFile ./../../config/xmonad/xmonad.hs;
      };
      displayManager.defaultSession = "none+xmonad";
      displayManager.sddm.enable = true;
      layout = "us";
      xkbVariant = "colemak";
      xkbOptions = "grp:win_space_toggle";
    };

    environment.systemPackages = with pkgs; [
      haskellPackages.xmobar
      bemenu
      pstree # for xmonad swallowing
      trayer # tray icons
      feh # wallpaper
      imv # or sxiv
      cmus # music player
      betterlockscreen
      xclip
      maim
      firefox
      pulsemixer
      mpv
      zathura
      bashmount
    ];

    home-manager.users.${user}.home.packages = [pkgs.ubuntu_font_family];

    home-manager.users.${user}.xdg.configFile."xmonad/xmonad.hs".source = ./../../config/xmonad/xmonad.hs;
    home-manager.users.${user}.xdg.configFile."xmobar/xmobarrc".source = ./../../config/xmobar/xmobarrc;
    # wallpaper
    home-manager.users.${user}.xdg.configFile."wall".source = ./../../bin/pix/naturaleza/christina-deravedisian-planta-azul.jpg;
  };
}
