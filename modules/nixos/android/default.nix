{
  user,
  pkgs,
  ...
}: {
  programs.adb.enable = true;
  users.users.${user}.extraGroups = ["adbusers"];
  environment.systemPackages = [pkgs.android-tools];
}
