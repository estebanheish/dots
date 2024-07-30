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
  };
  xdg.configFile."yazi/init.lua".text = ''
    require("session"):setup {
    	sync_yanked = true,
    }
  '';
  home.packages = [pkgs.inconsolata-nerdfont]; # for icons
}
