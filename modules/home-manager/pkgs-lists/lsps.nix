{pkgs, ...}: {
  home.packages = with pkgs; [
    rust-analyzer
    nodePackages.bash-language-server
    dart
    haskell-language-server
    # rnix-lsp
    nil
    taplo
    nodePackages.typescript-language-server
    nodePackages.pyright
    # vls

    # not in nixpkgs
    # awk-language-server
  ];
}
