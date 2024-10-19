{pkgs, ...}: {
  home.packages = with pkgs; [
    # rust-analyzer
    # nodePackages.bash-language-server
    # haskell-language-server
    nil
    alejandra
    taplo
    vscode-langservers-extracted
    nodePackages_latest.prettier
    # nodePackages.typescript-language-server
    # nodePackages.pyright
    # vls

    # not in nixpkgs
    # awk-language-server
  ];
}
