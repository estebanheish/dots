{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.helix;
in
{

  options = {
    modules.helix.enable = mkEnableOption "helix";
  };

  config = mkIf cfg.enable {

    hm.programs.helix.enable = true;
    hm.xdg.configFile."helix" = { source = ./../../config/helix; recursive = true; };

    hm.home.packages = with pkgs; [
      rust-analyzer
      nodePackages.bash-language-server
      dart
      haskell-language-server
      rnix-lsp
      taplo
      nodePackages.typescript-language-server
      nodePackages.pyright
      # vls
      # not in nixpkgs
      # awk-language-server 
    ];
  };
}
