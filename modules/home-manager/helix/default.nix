args @ {...}: {
  programs.helix = {
    enable = true;
  };
  xdg.configFile = {
    "helix/config.toml" = {
      text = let
        cfg = builtins.readFile ../../../configs/helix/config.toml;
      in
        if builtins.hasAttr "theme" args
        then "theme = \"${args.theme.name.helix}\"\n\n" + cfg
        else cfg;
    };
    "helix/languages.toml".source = ../../../configs/helix/languages.toml;
  };
}
