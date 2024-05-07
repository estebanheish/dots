{
  pkgs,
  theme,
  ...
}:
with theme.menu; {
  home.packages = with pkgs; [ubuntu_font_family tofi];
  xdg.configFile."tofi/config_dmenu".text = ''
    font = "${pkgs.ubuntu_font_family}/share/fonts/ubuntu/Ubuntu-B.ttf"
    font-size = 15

    text-color = ${text}
    alternate-result-color = ${text2}

    selection-color = ${focus.fg}
    selection-background = ${focus.bg}
    selection-background-padding = 2
    selection-background-padding = 0,6,0,6
    selection-background-corner-radius = 5

    text-cursor = true
    text-cursor-style = bar
    text-cursor-thickness = 10

    prompt-text = "  "
    prompt-padding = 0
    placeholder-text = ""
    num-results = 0
    result-spacing = 10
    horizontal = true
    min-input-width = 200

    width = 100%
    height = 25
    background-color = ${bg}
    outline-width = 0
    border-width = 0
    padding-top = 0
    padding-bottom = 0
    padding-left = 0
    padding-right = 0

    anchor = top

    # matching-algorithm = fuzzy
    ascii-input = true
    drun-launch = true
  '';

  xdg.configFile."tofi/config_list".text = ''
    font = "${pkgs.ubuntu_font_family}/share/fonts/ubuntu/Ubuntu-B.ttf"
    font-size = 15

    text-color = ${text}
    alternate-result-color = ${text2}

    selection-color = ${focus.fg}
    selection-background = ${focus.bg}
    selection-background-padding = 2
    selection-background-padding = 2,8,2,6
    selection-background-corner-radius = 5

    text-cursor = true
    text-cursor-style = bar
    text-cursor-thickness = 10

    prompt-text = "  "
    prompt-padding = 30
    placeholder-text = ""
    num-results = 0
    result-spacing = 8
    horizontal = false
    min-input-width = 200

    width = 100%
    height = 100%
    background-color = ${bg}EB
    outline-width = 0
    border-width = 0
    padding-top = 0
    padding-bottom = 0
    padding-left = 0
    padding-right = 0

    anchor = top

    # matching-algorithm = fuzzy
    ascii-input = true
    drun-launch = true
  '';
}
