{...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
  xdg.configFile."nvim" = {
    source = ../../../configs/nvim;
    recursive = true;
  };
}
