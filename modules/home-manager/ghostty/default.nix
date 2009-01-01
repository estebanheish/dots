{pkgs, ...}: {
  home.packages = with pkgs; [ghostty monaspace];
  xdg.configFile."ghostty/config".text = ''
    font-family = Monaspace Xenon
    font-size = 14
    theme = Builtin Solarized Dark
    window-decoration = false
    confirm-close-surface = false
    resize-overlay = never
    window-padding-x = 8
    window-padding-y = 6
  '';
}
