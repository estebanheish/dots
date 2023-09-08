{
  user,
  pkgs,
  ...
}: {
  programs.adb.enable = true;
  virtualisation.waydroid.enable = true;
  users.users.${user}.extraGroups = ["adbusers"];
  environment.systemPackages = with pkgs; [android-tools scrcpy];
}
