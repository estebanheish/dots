{colors, ...}: let
  mainMonitor = "LG Electronics LG HDR 4K 204NTGYHG007";
  secondMonitor = "LG Electronics LG ULTRAWIDE 0x00009E0B";
in ''
  # outputs
  monitor = desc:LG Electronics LG HDR 4K 204NTGYHG007, preferred, 2560x0, 1
  monitor = desc:LG Electronics LG ULTRAWIDE 0x00009E0B, preferred, 0x540, 1
  monitor = desc:BNQ ZOWIE XL LCD XBG00968SL0, disable

  # monitor = desc:LG Electronics LG HDR 4K 204NTGYHG007, disable
  # monitor = desc:LG Electronics LG ULTRAWIDE 0x00009E0B, disable
  # monitor = desc:BNQ ZOWIE XL LCD XBG00968SL0, 1920x1080@240Hz, 0x0, 1

  # worskpace binds
  wsbind = 1, desc:${mainMonitor}
  wsbind = 2, desc:${mainMonitor}
  wsbind = 3, desc:${mainMonitor}
  wsbind = 4, desc:${mainMonitor}
  wsbind = 5, desc:${mainMonitor}
  wsbind = 6, desc:${mainMonitor}
  workspace = desc:${mainMonitor}, 1

  wsbind = 7, desc:${secondMonitor}
  wsbind = 8, desc:${secondMonitor}
  wsbind = 9, desc:${secondMonitor}
  workspace = desc:${secondMonitor}, 9

  input {
      kb_layout = us, es
      # kb_variant = colemak
      kb_options = grp:ctrls_toggle
      follow_mouse = 1
      repeat_rate = 50
      repeat_delay = 300
      natural_scroll = yes
      # accel_profile = flat

      touchpad {
          natural_scroll = yes
      }

      sensitivity = -0.75
  }

  bind = SUPERSHIFTCTRL, c, exec, hyprctl keyword input:kb_variant colemak,
  bind = SUPERSHIFTCTRL, q, exec, hyprctl keyword input:kb_variant ,

  general {
      gaps_in = 5
      gaps_out = 10
      border_size = 2
      no_border_on_floating = false

      col.active_border = 0xFF${colors.focus_window}
      col.inactive_border = 0xFF${colors.background}
      col.group_border = 0xFF${colors.foreground}
      col.group_border_active = 0xFF${colors.focus}


      apply_sens_to_raw = 0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)

      cursor_inactive_timeout = 30
      layout = master
  }

  decoration {
      rounding = 2

      blur = false
      blur_size = 20 # minimum 1
      blur_passes = 3 # minimum 1
      blur_new_optimizations = 1

      drop_shadow = false
      shadow_range = 80
      shadow_render_power = 50
      col.shadow = rgba(00000065)
      # col.shadow_inactive = rgb(1c252c)
  }

  animations {
      enabled = 1
      animation = windows, 0, 1, default, popin
      animation = border, 1, 8, default
      animation = fade, 1, 5, default
      animation = workspaces, 0, 1, default
  }

  dwindle {
      preserve_split = true
      pseudotile = 0 # enable pseudotiling on dwindle
  }

  master {
      no_gaps_when_only = yes
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
      mouse_move_enables_dpms = true
  }

  blurls = gtk-layer-shell
  blurls = notifications
  blurls = lockscreen
  blurls = menu


  # window rules
  windowrulev2 = workspace 4, class:^(org.telegram.desktop)$

  # binds
  #
  # basic
  bind = SUPER, d, killactive,
  bind = SUPERSHIFT, Return, exec, foot
  bind = SUPER, r, exec, firefox
  bind = SUPERSHIFT, r, exec, p=$(rg Name= ~/.mozilla/firefox/profiles.ini | choose -f '=' 1 | bmenu); [ -n "$p" ] && firefox -P $p
  bind = SUPER, t, exec, bmenu-run
  bind = SUPERSHIFT, t, exec, bfiles
  bind = SUPER, v, exec, bclip
  bind = SUPER, Tab, fullscreen, 0
  bind = SUPERSHIFT, Tab, togglefloating,
  bind = ALT, Tab, fakefullscreen
  bind = SUPER, XF86Reload, exec, hyprctl reload
  bind = SUPERSHIFT, XF86Reload, forcerendererreload,
  bind = SUPERSHIFTALT, XF86Reload, exit,
  bind = SUPER, b, exec, eww open --toggle bar
  bind = ALTSHIFT, Tab, pin, active
  bind = SUPER, o, exec, makoctl dismiss
  bind = SUPER, z, togglespecialworkspace,
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
  bind = SUPERSHIFTALT, m, exec, hyprctl keyword general:layout master; eww update layout="master"
  bind = SUPER, m, layoutmsg, focusmaster
  bind = SUPERSHIFT, m, layoutmsg, swapwithmaster
  bind = SUPERCTRL, k, layoutmsg, addmaster
  bind = SUPERSHIFTCTRL, k, layoutmsg, removemaster

  # dwindle layout
  # bind = SUPERSHIFT, D, exec, hyprctl keyword general:layout dwindle; eww update layout="dwindle"
  # bind = SUPERSHIFT, k, togglesplit

  # both layouts
  bind = SUPER, k, togglegroup,
  # bind = SUPER, F9, lockgroups, unlock
  # bind = SUPER, F10, lockgroups, lock
  bind = SUPERCTRL, e, changegroupactive, b
  bind = SUPERCTRL, n, changegroupactive, f

  # open stuff
  # bind=SUPER_SHIFT,w,exec,qutebrowser
  bind = SUPER, 1, exec, foot btm
  bind = SUPER, 2, exec, foot ncmpcpp
  bind = SUPER, 3, exec, nautilus

  # audio
  bind = SUPER, a, exec, foot pulsemixer
  bind = SUPERSHIFT, a, exec, foot alsamixer
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
  bind = SUPER, F12, exec, swaylock -f
  bind = SUPER, XF86ScreenSaver, exec, swaylock -f
  bind = SUPERSHIFT, F12, exec, swaylock -f; sleep 1; hyprctl dispatch dpms off

  # yt-dl
  # bind = , XF86HomePage, exec, yt-dlp -x "$(wl-paste)" -P ~/Music/yt-dlp
  # bind = SHIFT, XF86HomePage, exec, yt-dlp "$(wl-paste)" -P ~/Videos

  # start
  # exec-once = hyprpaper
  exec-once = swaybg -c '##${colors.wall_solid}'
  exec-once = hyprctl setcursor capitaine-cursors-white 42
  exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
  exec-once = wl-paste --watch cliphist store
  exec-once = swayidle -w timeout 300 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1; swaylock -f' timeout 310 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
  exec-once = eww open bar

  # environment variables
  env = XDG_CURRENT_DESKTOP,Hyprland
  env = XDG_SESSION_TYPE,wayland
  env = XDG_SESSION_DESKTOP,Hyprland
  env = NIXOS_OZONE_WL,1

  env = GDK_BACKEND, wayland
  env = QT_QPA_PLATFORM,wayland
  env = SDL_VIDEODRIVER,wayland
  env = CLUTTER_BACKEND,wayland

  env = QT_AUTO_SCREEN_SCALE_FACTOR=1
  env = QT_QPA_PLATFORM,wayland
  env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
  env = QT_QPA_PLATFORMTHEME,qt5ct
''
