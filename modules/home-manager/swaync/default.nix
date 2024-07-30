{
  theme,
  pkgs,
  ...
}:
with theme.notis; {
  home.packages = [pkgs.swaynotificationcenter];

  xdg.configFile = {
    "swaync/style.css".text = ''
      @define-color cc-bg #${bg};
      @define-color noti-border-color #${border};
      @define-color noti-bg #${layer};
      @define-color noti-bg-opaque #${layer};
      @define-color noti-bg-darker #${bg};
      @define-color noti-bg-hover #${hover};
      @define-color noti-bg-hover-opaque #${hover};
      @define-color noti-bg-focus #${bg};
      @define-color noti-close-bg #${layer};
      @define-color noti-close-bg-hover #${border};
      @define-color text-color #${text};
      @define-color text-color-disabled #${muted};
      @define-color bg-selected #${accent};

      .widget-title {
        margin: 20px 25px 10px;
      }

      .widget-dnd {
        margin: 8px 25px 8px;
      }
    '';
    "swaync/config.json".text = ''
      {
        "control-center-margin-top": 10,
        "control-center-margin-bottom": 10,
        "control-center-margin-right": 10,
        "control-center-margin-left": 10
      }
    '';
  };
}
