{
  pkgs,
  theme,
  ...
}: {
  home.packages = [pkgs.ironbar];
  xdg.configFile = {
    "ironbar/config.yaml" = {
      text = ''
        monitors:
          HDMI-A-1:
            name: "main"
            position: "top"
            height: 24
            anchor_to_edges: true
            start:
              - type: "workspaces"
                all_monitors: true
            end:
              - type: "tray"
              - type: "clock"
                format: "%a %d. %R"
      '';
    };
    "ironbar/style.css" = {
      text = ''
        * {
            font-family: Ubuntu;
            font-weight: Bold;
            font-size: 18px;
            border: none;
            border-radius: 0;
            padding: 0;
            margin: 0;
        }

        box, menubar, button {
            background-color: #${theme.bar.background};
            background-image: none;
            box-shadow: none;
        }

        button:hover {
            background-color: #${theme.bar.layer};
        }

        scale trough {
            min-width: 1px;
            min-height: 2px;
        }

        .background {
            background-color: #${theme.bar.background};
        }

        #bar {
            margin-left: 1em;
            margin-right: 1em;
        }

        .workspaces .item {
            margin-left: 0.2em;
            margin-right: 0.2em;
            border-radius: 25%;
            padding: 0em 0.25em;
            margin: 0em 0.1em;
        }

        .workspaces .item.focused {
            color: #${theme.bar.layer};
            background-color: #${theme.bar.accent};
        }

        .tray {
            margin-top: 0;
            margin-bottom: 0;
            margin-right: 1em;
        }
      '';
    };
  };
}
