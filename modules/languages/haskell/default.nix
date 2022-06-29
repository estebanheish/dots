{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.languages.haskell;
in
{

  options = {
    modules.languages.haskell.enable = mkEnableOption "haskell";
  };

  config = mkIf cfg.enable {
    hm.home.packages = with pkgs; [
      (
        let
          haskellPkgs = ps: with ps; [
            brick
            aeson
            wreq
            QuickCheck
            regex-pcre
            matrix
            split
            #http-conduit
            #scalpel
            #cursor
            #http-conduit
          ];
        in
        (haskellPackages.ghcWithPackages haskellPkgs)
      )
      stack
      haskell-language-server
      #haskellPackages.ghcup
    ];
    services.hoogle.enable = true;
  };

}
