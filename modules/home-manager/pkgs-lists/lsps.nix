{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    alejandra
    taplo
    lua-language-server
  ];
}
