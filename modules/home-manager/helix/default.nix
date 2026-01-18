{
  pkgs,
  config,
  ...
}: {
  home.packages = [pkgs.evil-helix];
  xdg.configFile."helix" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/helix";
    recursive = true;
  };
}
