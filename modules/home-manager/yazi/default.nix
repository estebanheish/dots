{...}: {
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
}
