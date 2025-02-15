{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [inputs.ghostty.packages.${pkgs.system}.default monaspace];
  xdg.configFile."ghostty/config".text = ''
    font-family = Monaspace Xenon
    font-size = 14
    theme = rose-pine
    window-decoration = false
    confirm-close-surface = false
    resize-overlay = never
    window-padding-x = 8
    window-padding-y = 6
  '';
}
