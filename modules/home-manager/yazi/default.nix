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
      manager = {
        border_symbol = " ";
      };
    };
    settings = {
      preview = {
        max_width = 2160;
        max_heigh = 2160;
      };
    };
  };
  xdg.configFile."yazi/init.lua".text = ''
    require("session"):setup {
    	sync_yanked = true,
    }
  '';
  home.packages = [pkgs.nerd-fonts.inconsolata]; # for icons
}
