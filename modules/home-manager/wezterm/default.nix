{
  pkgs,
  inputs,
  theme,
  ...
}: {
  home.packages = [inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default];
  xdg.configFile =
    {
      "wezterm/wezterm.lua".source = ../../../configs/wezterm/wezterm.lua;
    }
    // (
      if theme.terminal.custom_tab
      then
        with theme.terminal; {
          "wezterm/colors.lua".text = ''
              return {
              window_frame = {
                active_titlebar_bg = "#${window_frame.active_titlebar_bg}",
                inactive_titlebar_bg = "#${window_frame.inactive_titlebar_bg}",
              },
              colors = {
                scrollbar_thumb = '#${colors.scrollbar_thumb}',
                tab_bar = {
                  inactive_tab_edge = '#${colors.tab_bar.inactive_tab_edge}',
                  active_tab = {
                    bg_color = '#${colors.tab_bar.active_tab.bg_color}',
                    fg_color = '#${colors.tab_bar.active_tab.fg_color}',
                  },
                  inactive_tab = {
                    bg_color = '#${colors.tab_bar.inactive_tab.bg_color}',
                    fg_color = '#${colors.tab_bar.inactive_tab.fg_color}',
                  },
                  inactive_tab_hover = {
                    bg_color = '#${colors.tab_bar.inactive_tab_hover.bg_color}',
                    fg_color = '#${colors.tab_bar.inactive_tab_hover.fg_color}',
                  },
                  new_tab = {
                    bg_color = '#${colors.tab_bar.new_tab.bg_color}',
                    fg_color = '#${colors.tab_bar.new_tab.fg_color}',
                  },
                  new_tab_hover = {
                    bg_color = '#${colors.tab_bar.new_tab_hover.bg_color}',
                    fg_color = '#${colors.tab_bar.new_tab_hover.fg_color}',
                  },
                },
              },
            }
          '';
        }
      else {}
    );
}
