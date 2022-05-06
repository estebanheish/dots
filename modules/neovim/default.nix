{ config, lib, pkgks, ... }:
with lib;
let 
  cfg = config.modules.neovim;
in
{

  options = {
    modules.neovim.enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    hm.programs.neovim = {
      enable = true;

      plugins = with pkgs.vimPlugin; [
        # basic
        vim-surround
        vim-commentary
        telescope-nvim
        vim-fugitive

        # highlighting
        nvim-treesitter

        # semantic language support
        nvim-lspconfig
        lsp_extensions-nvim

        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        nvim-cmp
        #lsp_signature-nvim 

        # snips
        cmp_luasnip
        luasnip

        # sintactic language support 
        vim-nix
        rust-vim

        # ...
        lspsaga-nvim
        #which-key-nvim
        #neorg
        #plenary-nvim


        # others
        nvim-colorizer-lua
        nvim-base16
        crates-nvim
      ];

      extraPackages = 
      ];

    };

    hm.xdg.configFile."nvim" = { source = ./../../config/nvim; recursive = true; };

  };

}
