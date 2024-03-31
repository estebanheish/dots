{
  colors,
  profile,
  ...
}: let
  m1 = "HDMI-A-1"; # LG Electronics LG HDR 4K 204NTGYHG007";
  m2 = "HDMI-A-2"; # "LG Electronics LG ULTRAWIDE 0x00009E0B";
in ''
  # outputs
  monitor = desc:LG Electronics LG HDR 4K 204NTGYHG007, preferred, 2560x0, 1.5
  monitor = desc:LG Electronics LG ULTRAWIDE 0x00009E0B, preferred, 0x540, 1
  monitor = desc:BNQ ZOWIE XL LCD XBG00968SL0, disable

  # monitor = desc:LG Electronics LG HDR 4K 204NTGYHG007, disable
  # monitor = desc:LG Electronics LG ULTRAWIDE 0x00009E0B, disable
  # monitor = desc:BNQ ZOWIE XL LCD XBG00968SL0, 1920x1080@240Hz, 0x0, 1

  # worskpace binds
  workspace = 1, monitor:${m1}, default:true
  workspace = 2, monitor:${m1}
  workspace = 3, monitor:${m1}
  workspace = 4, monitor:${m1}
  workspace = 5, monitor:${m1}
  workspace = 6, monitor:${m1}

  workspace = 7, monitor:${m2}
  workspace = 8, monitor:${m2}
  workspace = 9, monitor:${m2}, default:true

  input {
      kb_layout = us, es
      ${
    if profile == "nyx"
    then "kb_variant = ,"
    else "kb_variant = colemak,"
  }
      kb_options = grp:ctrls_toggle
      follow_mouse = 1
      repeat_rate = 50
      repeat_delay = 300
      natural_scroll = yes
      # accel_profile = flat

      touchpad {
          natural_scroll = yes
      }

      ${
    if profile == "nyx"
    then "sensitivity = -1"
    else ""
  }
  }

  bind = SUPERSHIFTCTRL, c, exec, hyprctl keyword input:kb_variant colemak,
  bind = SUPERSHIFTCTRL, q, exec, hyprctl keyword input:kb_variant ,

  general {
      gaps_in = ${
    if colors.flat
    then "0"
    else "5"
  }
      gaps_out = ${
    if colors.flat
    then "0"
    else "10"
  }
      border_size = 3
      no_border_on_floating = false

      allow_tearing = true

      col.active_border = rgb(${colors.primary})
      # col.active_border = rgb(${colors.primary}) rgb(${colors.secondary}) 0deg
      col.inactive_border = rgb(${colors.outline})


      apply_sens_to_raw = 0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)

      cursor_inactive_timeout = 30
      layout = master
  }

  decoration {
      rounding = ${
    if colors.flat
    then "0"
    else "10"
  }

  drop_shadow = ${
    if colors.flat
    then "false"
    else "true"
  }
      shadow_range = 20
      shadow_render_power = 15
      col.shadow = rgba(00000065)
      # col.shadow_inactive = rgb(1c252c)

    blur {
      enabled = true
      size = 8 # minimum 1
      passes = 3 # minimum 1
      new_optimizations = 1
    }

  }

  animations {
      enabled = ${
    if colors.flat
    then "false"
    else "true"
  }
      animation = windows, 1, 1, default, popin
      animation = border, 1, 8, default
      animation = fade, 1, 5, default
      animation = workspaces, 1, 2, default
  }

  dwindle {
      preserve_split = true
      pseudotile = 0
  }

  master {
      no_gaps_when_only = 1
      new_is_master = no
  }

  gestures {
      workspace_swipe = no
  }

  misc {
      disable_hyprland_logo = yes
      disable_splash_rendering = yes
      disable_autoreload = yes
      enable_swallow = yes
      swallow_regex = ^(foot)$
      swallow_exception_regex = ^(noswallow)$
      mouse_move_enables_dpms = true
      new_window_takes_over_fullscreen = 2
      background_color = rgb(${colors.background})

      # animate_manual_resizes = true
      # animate_mouse_windowdragging = true
  }

  group {
    col.border_inactive = rgb(${colors.tertiary_container})
    col.border_active = rgb(${colors.tertiary})
    groupbar {
      enabled = false
    }
  }

  xwayland {
    force_zero_scaling = true
  }

  blurls = gtk-layer-shell
  blurls = notifications
  blurls = lockscreen
  blurls = menu
  blurls = launcher

  # window rules
  windowrulev2 = workspace 4, class:^(org.telegram.desktop)$
  windowrulev2 = center, class:^(firefox)$
  windowrulev2 = immediate, class:^Minecraft


  $terminal = XCURSOR_SIZE=24 foot
  $dmenu-run = tofi-drun -c ~/.config/tofi/config_dmenu
  $dmenu = tofi -c ~/.config/tofi/config_dmenu
  $lmenu = tofi -c ~/.config/tofi/config_list

  # binds
  #
  # basic
  bind = SUPER, Escape, killactive,
  bind = SUPERSHIFT, Return, exec, $terminal
  bind = SUPER, r, exec, firefox
  bind = SUPERSHIFT, r, exec, firefox_profile_select
  bind = SUPER, t, exec, $dmenu-run
  bind = SUPERSHIFT, t, exec, abre
  bind = SUPER, v, exec, cliphist list | $lmenu | cliphist decode | wl-copy
  bind = SUPER, Tab, fullscreen, 0
  bind = SUPERSHIFT, Tab, togglefloating,
  bind = ALT, Tab, fakefullscreen
  bind = SUPER, XF86Reload, exec, hyprctl reload
  bind = SUPERSHIFT, XF86Reload, forcerendererreload,
  bind = SUPERSHIFTALT, XF86Reload, exit,
  bind = SUPER, b, exec, nu -c "if (ironbar get-visible main) =~ 'true' { ironbar set-visible main } else { ironbar set-visible main -v }"
  bind = SUPERSHIFT, b, exec, toggle_flat
  bind = ALTSHIFT, Tab, pin, active
  bind = SUPER, o, exec, makoctl dismiss
  bind = SUPER, z, togglespecialworkspace,
  bind = SUPERSHIFT, z, movetoworkspacesilent, special
  bind = SUPER, x, bringactivetotop,

  bind = SUPER, equal, exec, hyprctl --batch "keyword general:gaps_in 0 ; keyword general:gaps_out 0"
  bind = SUPERSHIFT, equal, exec, hyprctl --batch "keyword general:gaps_in 5 ; keyword general:gaps_out 10"

  # basic movement
  bind = SUPER, H, movefocus, l
  bind = SUPER, I, movefocus, r
  bind = SUPER, E, movefocus, u
  bind = SUPER, N, movefocus, d

  bind = SUPERSHIFT, H, movewindow, l
  bind = SUPERSHIFT, I, movewindow, r
  bind = SUPERSHIFT, E, movewindow, u
  bind = SUPERSHIFT, N, movewindow, d

  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow

  bind = SUPER, comma, focusmonitor, l
  bind = SUPER, period, focusmonitor, r
  bind = SUPERSHIFT, comma, movewindow, mon:1
  bind = SUPERSHIFT, period, movewindow, mon:0
  bind = SUPER, slash, swapactiveworkspaces, 0 1

  bind = SUPER, q, workspace, 1
  bind = SUPER, w, workspace, 2
  bind = SUPER, f, workspace, 3
  bind = SUPER, p, workspace, 4
  bind = SUPER, g, workspace, 5
  bind = SUPER, j, workspace, 6
  bind = SUPER, l, workspace, 7
  bind = SUPER, u, workspace, 8
  bind = SUPER, y, workspace, 9
  bind = SUPER, semicolon, workspace, 10

  bind = SUPERSHIFT, q, movetoworkspacesilent, 1
  bind = SUPERSHIFT, w, movetoworkspacesilent, 2
  bind = SUPERSHIFT, f, movetoworkspacesilent, 3
  bind = SUPERSHIFT, p, movetoworkspacesilent, 4
  bind = SUPERSHIFT, g, movetoworkspacesilent, 5
  bind = SUPERSHIFT, j, movetoworkspacesilent, 6
  bind = SUPERSHIFT, l, movetoworkspacesilent, 7
  bind = SUPERSHIFT, u, movetoworkspacesilent, 8
  bind = SUPERSHIFT, y, movetoworkspacesilent, 9
  bind = SUPERSHIFT, semicolon, movetoworkspacesilent, 10

  bind = SUPER, mouse_down, workspace, e+1
  bind = SUPER, mouse_up, workspace, e-1

  binde = SUPER, left, splitratio, -0.05
  binde = SUPER, right, splitratio, +0.05

  # master layout
  bind = SUPERSHIFTALT, m, exec, hyprctl keyword general:layout master
  bind = SUPER, m, layoutmsg, focusmaster
  bind = SUPERSHIFT, m, layoutmsg, swapwithmaster
  bind = SUPERCTRL, h, layoutmsg, addmaster
  bind = SUPERCTRL, i, layoutmsg, removemaster
  bind = SUPERCTRL, up, layoutmsg, orientationtop
  bind = SUPERCTRL, down, layoutmsg, orientationbottom
  bind = SUPERCTRL, left, layoutmsg, orientationleft
  bind = SUPERCTRL, right, layoutmsg, orientationright

  # grouped windows
  bind = SUPER, k, togglegroup,
  bind = SUPERCTRL, k, lockgroups, toggle
  bind = SUPERCTRL, e, changegroupactive, b
  bind = SUPERCTRL, n, changegroupactive, f
  bind = SUPERCTRLSHIFT, e, movewindoworgroup, u
  bind = SUPERCTRLSHIFT, n, movewindoworgroup, d

  # dwindle layout
  # bind = SUPERSHIFTALT, d, exec, hyprctl keyword general:layout dwindle
  # bind = SUPERSHIFT, k, togglesplit

  # open stuff
  # bind=SUPER_SHIFT,w,exec,qutebrowser
  bind = SUPER, x, exec, $terminal btm
  bind = SUPER, c, exec, $terminal ncmpcpp

  # audio
  bind = SUPER, a, exec, $terminal pulsemixer
  bind = SUPERSHIFT, a, exec, $terminal alsamixer
  binde = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+
  binde = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-
  bind = SHIFT, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
  bind = SHIFT, XF86AudioPlay, exec, playerctl play-pause
  bind = SHIFT, XF86AudioPrev, exec, playerctl previous
  bind = SHIFT, XF86AudioNext, exec, playerctl next

  # mpd
  bind = , XF86AudioPlay, exec, mpc toggle
  bind = , XF86AudioNext, exec, mpc next
  bind = , XF86AudioPrev, exec, mpc prev
  bind = SHIFT, XF86AudioRaiseVolume, exec,mpc volume +2
  bind = SHIFT, XF86AudioLowerVolume, exec,mpc volume -2

  # screenshots
  bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
  bind = SHIFT, Print, exec, grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy

  # power
  bind = SUPER, F12, exec, loginctl lock-session
  bind = SUPER, XF86ScreenSaver, exec, loginctl lock-session

  # start
  ${
    if builtins.hasAttr "wall" colors
    then "exec-once = hyprpaper"
    else ""
  }
  # exec-once = hyprctl setcursor capitaine-cursors-white 32
  exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
  exec-once = wl-paste --watch cliphist store
  # exec-once = swayidle -w timeout 300 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1; swaylock -f' timeout 310 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
  exec-once = hypridle
  exec-once = ironbar

  # environment variables
  env = XDG_CURRENT_DESKTOP,Hyprland
  env = XDG_SESSION_TYPE,wayland
  env = XDG_SESSION_DESKTOP,Hyprland
  env = NIXOS_OZONE_WL,1

  env = LIBVA_DRIVER_NAME,nvidia
  env = GBM_BACKEND,nvidia-drm
  env = __GLX_VENDOR_LIBRARY_NAME,nvidia
  # env = WLR_DRM_NO_ATOMIC,1
  # env = WLR_NO_HARDWARE_CURSORS,1

  env = GDK_BACKEND, wayland
  env = SDL_VIDEODRIVER,wayland
  env = CLUTTER_BACKEND,wayland

  env = QT_AUTO_SCREEN_SCALE_FACTOR,1
  env = QT_QPA_PLATFORM,wayland;xcb
  env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
  env = QT_QPA_PLATFORMTHEME,qt5ct

  # cursors
  env = HYPRCURSOR_THEME, capitan-light
  env = HYPRCURSOR_SIZE, 32
  env = XCURSOR_THEME, capitaine-cursors-white
  env = XCURSOR_SIZE, 32
''
