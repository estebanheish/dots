{
  pkgs,
  user,
  # config,
  # inputs,
  ...
}: {
  environment.localBinInPath = true;
  security.polkit.enable = true;

  # external monitor backlight
  hardware.i2c.enable = true;
  environment.systemPackages = with pkgs; [ddcutil];
  users.users.${user}.extraGroups = ["i2c"];

  home-manager.users.${user} = {
    imports = [
      ../../../modules/home-manager/hyprland
      ../../../modules/home-manager/librewolf
      ../../../modules/home-manager/mpv
    ];
  };

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
      initial_session = {
        command = "Hyprland";
        inherit user;
      };
    };
  };
}
