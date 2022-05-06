{ config, lib, pkgs, ... }:
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

      plugins = with pkgs.vimPlugins; [
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

      extraConfig = ''
        lua << EOF
        require('settings')
        require('maps')
        require('lsp')
        require('lsp_saga')
        require('treesitter')
        require('crates').setup()
        require('colorizer').setup()
        
        require('neorg').setup {
          load = {
              ["core.defaults"] = {}
          }
        }
        
        -- colors
        require('base16-colorscheme').setup({
        base00 = '#212121', base01 = '#303030', base02 = '#353535', base03 = '#4A4A4A',
        base04 = '#B2CCD6', base05 = '#EEFFFF', base06 = '#EEFFFF', base07 = '#FFFFFF',
        base08 = '#F07178', base09 = '#F78C6C', base0A = '#FFCB6B', base0B = '#C3E88D',
        base0C = '#89DDFF', base0D = '#82AAFF', base0E = '#C792EA', base0F = '#FF5370',
        })
        EOF
      '';

      extraPackages = [
      ];

    };

    hm.xdg.configFile."nvim" = { source = ./../../config/nvim; recursive = true; };

  };

}
