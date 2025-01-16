{pkgs, ...}: let
  inherit (pkgs) nu_scripts;
  expand = f: l: builtins.concatStringsSep "\n" (map f l);
in {
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    plugins = with pkgs.nushellPlugins; [
      units
      skim
      query
      polars
      # net
      highlight
      gstat
      formats
      # dbus
    ];
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
}
