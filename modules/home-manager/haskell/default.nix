{pkgs, ...}: {
  home.packages = with pkgs; [
    (
      let
        haskellPkgs = ps:
          with ps; [
            random
            # brick
            # aeson
            # wreq
            # QuickCheck
            # regex-pcre
            matrix
            split
            aeson
            #http-conduit
            #scalpel
            #cursor
            #http-conduit
          ];
      in (haskellPackages.ghcWithPackages haskellPkgs)
    )
    stack
    haskell-language-server
    # haskellPackages.ghcup
  ];
}
