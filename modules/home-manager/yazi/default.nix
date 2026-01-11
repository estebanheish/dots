{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    keymap = {
      input.prepend_keymap = [
        {
          on = ["<Esc>"];
          run = "close";
          desc = "Cancel Input";
        }
      ];
    };
    theme = {
      mgr = {
        border_symbol = " ";
      };
      indicator = {
        padding = {
          open = "█";
          close = "█";
        };
      };
      status = {
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };
      };
      tabs = {
        sep_inner = {
          open = "";
          close = "";
        };
        sep_outer = {
          open = "";
          close = "";
        };
      };
    };
    settings = {
      preview = {
        max_width = 2160;
        max_heigh = 2160;
      };
    };
    initLua = ''
      require("session"):setup {
      	sync_yanked = true,
      }
    '';
  };
  home.packages = [pkgs.nerd-fonts.inconsolata]; # for icons
}
