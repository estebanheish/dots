{config, ...}: {
  flake.nixosModules.yazi = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
        shellWrapperName = "y";
        plugins = {
          drag = pkgs.yaziPlugins.drag;
        };
        keymap = {
          mgr.prepend_keymap = [
            {
              on = ["<C-n>"];
              run = "plugin drag";
              desc = "Drag selected files";
            }
            {
              on = ["g" "n"];
              run = "cd /home/${config.username}/.dots";
              desc = "Go to dotfiles";
            }
            {
              on = ["g" "c"];
              run = "cd /home/${config.username}/code";
              desc = "Go to code";
            }
          ];
          input.prepend_keymap = [
            {
              on = ["<Esc>"];
              run = "close";
              desc = "Cancel Input";
            }
          ];
        };
        theme = {
          flavor = {
            dark = "noctalia";
            light = "noctalia";
          };
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
            max_height = 2160;
          };
        };
        initLua = ''
          require("session"):setup {
          	sync_yanked = true,
          }
        '';
      };
      home.packages = with pkgs; [nerd-fonts.inconsolata ripdrag];
    };
  };
}
