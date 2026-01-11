{pkgs, ...}: let
  colors = {
    bg = "1c1c1c";
    layer = "252525";
    hover = "2f2f2f";
    border = "7aa2f7";
    text = "f8f8f2";
    muted = "a0a0a0";
    accent = "7aa2f7";
  };
in {
  home.packages = [pkgs.swaynotificationcenter];

  xdg.configFile = {
    "swaync/style.css".text = ''
      @define-color cc-bg #${colors.bg};
      @define-color noti-border-color #${colors.border};
      @define-color noti-bg #${colors.layer};
      @define-color noti-bg-opaque #${colors.layer};
      @define-color noti-bg-darker #${colors.bg};
      @define-color noti-bg-hover #${colors.hover};
      @define-color noti-bg-hover-opaque #${colors.hover};
      @define-color noti-bg-focus #${colors.bg};
      @define-color noti-close-bg #${colors.layer};
      @define-color noti-close-bg-hover #${colors.border};
      @define-color text-color #${colors.text};
      @define-color text-color-disabled #${colors.muted};
      @define-color bg-selected #${colors.accent};

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
