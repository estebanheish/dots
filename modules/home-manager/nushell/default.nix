args @ {pkgs, ...}: let
  inherit (pkgs) nu_scripts;
  expand = f: l: builtins.concatStringsSep "\n" (map f l);
  isTheme = builtins.hasAttr "theme" args;
in {
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
  };

  home.packages = with pkgs; [
    nufmt
  ];

  xdg.configFile."nushell" = {
    source = ../../../configs/nushell;
    recursive = true;
  };

  xdg.configFile."nushell/completions.nu".text = expand (s: "use ${nu_scripts}/share/nu_scripts/custom-completions/${s}/${s}-completions.nu *") [
    "nix"
    "git"
    "zellij"
    "rg"
    "rustup"
    "man"
    "less"
    "typst"
    "curl"
    # "btm"
    # "bat"

    "cargo"
    # "poetry"
    # "just"
    "make"
  ];

  xdg.configFile."nushell/plugins.nu".text = expand (s: "plugin add ${pkgs.nushellPlugins.${s}}/bin/nu_plugin_${s}") [
    "query"
    "polars"
    # "net" # TODO
    "gstat"
    "formats"
  ];

  xdg.configFile."nushell/init.nu" = {
    enable = true;
    text = let
      cfg = builtins.readFile ../../../configs/nushell/b_init.nu;
    in
      if isTheme
      then cfg + "source ~/.config/nushell/theme.nu\n"
      else cfg;
  };

  xdg.configFile."nushell/theme.nu" = {
    enable = isTheme;
    text = ''
      use ~/.config/nushell/themes/${args.theme.name.files}.nu
      $env.config = ($env.config | merge {
          color_config: (${args.theme.name.files})
      })
    '';
  };
}
