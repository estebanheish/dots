{
  theme,
  profile,
  ...
}:
with theme.hyprland; ''
    # outputs
    monitor=,preferred,auto,1
    # monitor = desc:BNQ ZOWIE XL LCD XBG00968SL0, disable
    # monitor = desc:LG Electronics LG ULTRAWIDE 0x00009E0B, preferred, 2560x0, 1
    # monitor = desc:LG Electronics LG HDR 4K 204NTGYHG007, disable
    # monitor = desc:LG Electronics LG ULTRAWIDE 0x00009E0B, disable
    # monitor = desc:BNQ ZOWIE XL LCD XBG00968SL0, 1920x1080@240Hz, 0x0, 1
  ${
    if profile == "nyx"
    then ''
      monitor = DP-1, 2560x1440@240.00Hz, 0x0, 1
      monitor = HDMI-A-1, preferred, 2560x0, 1.5
    ''
    else ""
  }
  ${
    if profile == "clank"
    then ''
      $main = HDMI-A-1
      $secondary = DP-3
      # $main = HDMI-A-2
      # $secondary = DP-4
      monitor = $secondary, 2560x1440@240.00Hz, 0x0, 1
      monitor = $main, preferred, 2560x0, 1.5
      # monitor = desc:LG Electronics LG HDR 4K 204NTGYHG007, disable

      # worskpace binds
      workspace = 1, monitor:$main, default:true
      workspace = 2, monitor:$main
      workspace = 3, monitor:$main
      workspace = 4, monitor:$main
      workspace = 5, monitor:$main
      workspace = 6, monitor:$main

      workspace = 7, monitor:$secondary
      workspace = 8, monitor:$secondary
      workspace = 9, monitor:$secondary, default:true
    ''
    else ""
  }

    input {
        kb_layout = us, es
        ${
    if builtins.elem profile ["nyx" "clank"]
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
    if builtins.elem profile ["nyx" "clank"]
    then "sensitivity = -0.8"
    else ""
  }
    }

    bind = SUPERSHIFTCTRL, c, exec, hyprctl keyword input:kb_variant colemak,
    bind = SUPERSHIFTCTRL, q, exec, hyprctl keyword input:kb_variant ,

    general {
        gaps_in = ${
    if theme.flat
    then "0"
    else "5"
  }
        gaps_out = ${
    if theme.flat
    then "0"
    else "10"
  }
        border_size = ${
    if theme.flat
    then "2"
    else "3"
  }
        no_border_on_floating = false

        allow_tearing = true

        col.active_border = ${border.active}
        col.inactive_border = ${border.inactive}

        layout = master
    }

    cursor {
      inactive_timeout = 30
    }

    decoration {
        rounding = ${
    if theme.flat
    then "0"
    else "10"
  }

    shadow {

    enabled = ${
    if theme.flat
    then "false"
    else "true"
  }
        range = 20
        render_power = 15
        color = rgba(00000065)
        # col.inactive = rgb(1c252c)
    }

      blur {
        enabled = ${
    if theme.flat
    then "false"
    else "true"
  }
        size = 8 # minimum 1
        passes = 3 # minimum 1
        new_optimizations = 1
      }

    }

    animations {
        enabled = ${
    if theme.flat
    then "false"
    else "true"
  }
        animation = windows, 1, 1, default, popin
        animation = border, 1, 8, default
        animation = fade, 1, 5, default
        animation = workspaces, 1, 2, default
        animation = specialWorkspace, 1, 2, default, fade
    }

    dwindle {
        preserve_split = true
        pseudotile = 0
    }

    master {
        new_status = slave
    }

    gestures {
        workspace_swipe = no
    }

    misc {
        disable_hyprland_logo = yes
        disable_splash_rendering = yes
        disable_autoreload = yes
        enable_swallow = yes
        swallow_regex = ^(com.mitchellh.ghostty)$
        # swallow_exception_regex = ^(noswallow)$
        mouse_move_enables_dpms = true
        new_window_takes_over_fullscreen = 2
        background_color = rgb(${bg})
        vrr = 2

        # animate_manual_resizes = true
        # animate_mouse_windowdragging = true
    }

    group {
      col.border_active = ${border.active}
      col.border_inactive = ${border.inactive}
      groupbar {
        enabled = true
        text_color = rgb(${groupbar.text})
        col.active = rgb(${groupbar.active})
        col.inactive = rgb(${groupbar.inactive})
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
    windowrulev2 = suppressevent maximize, class:.*
    windowrulev2 = workspace 4, class:^(Logseq)$
    windowrulev2 = workspace 5, class:^(org.telegram.desktop)$
    windowrulev2 = center, class:^(librewolf)$
    windowrulev2 = immediate, class:^(steam_app_1422450)$

    # "smart gaps” / “no gaps when only"
    workspace = w[tv1], gapsout:0, gapsin:0
    workspace = f[1], gapsout:0, gapsin:0
    windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
    windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
    windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
    windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

    $terminal_with = ghostty -e
    $terminal = ghostty

    # binds
    #
    # basic
    bind = SUPER, Escape, killactive,
    bind = SUPERSHIFT, Return, exec, $terminal
    bind = SUPER, r, exec, firefox-esr
    bind = SUPERSHIFT, r, exec, firefox_profile_select
    bind = SUPER, t, exec, kickoff
    bind = SUPERSHIFT, t, exec, abre
    bind = SUPER, v, exec, cliphist list | kickoff --from-stdin --stdout | cliphist decode | wl-copy
    bind = SUPER, Tab, fullscreen, 0
    bind = SUPERSHIFT, Tab, togglefloating,
    bind = ALT, Tab, fullscreenstate, -1 2
    bind = SUPER, XF86Reload, exec, hyprctl reload
    bind = SUPERSHIFT, XF86Reload, forcerendererreload,
    bind = SUPERSHIFTALT, XF86Reload, exit,
    bind = SUPER, b, exec, nu -c "if (ironbar get-visible main) =~ 'true' { ironbar set-visible main } else { ironbar set-visible main -v }"
    bind = SUPERSHIFT, b, exec, toggle_flat
    bind = ALTSHIFT, Tab, pin, active
    bind = SUPER, z, togglespecialworkspace,
    bind = SUPERSHIFT, z, movetoworkspacesilent, special
    bind = SUPER, x, bringactivetotop,
    bind = SUPER, o, exec, swaync-client -t
    bind = SUPER, s, exec, tts
    bind = SUPERSHIFT, s, exec, tts --mpv

    # backlight
    binde = , XF86MonBrightnessUp, exec, brightnessctl set +10%
    binde = , XF86MonBrightnessDown, exec, brightnessctl set 10%-

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
    bind = SUPERSHIFT, comma, movewindow, mon:l
    bind = SUPERSHIFT, period, movewindow, mon:r
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
    bind = SUPER, x, exec, $terminal_with btm
    bind = SUPER, c, exec, $terminal_with ncmpcpp

    # audio
    bind = SUPER, a, exec, $terminal_with pulsemixer
    bind = SUPERSHIFT, a, exec, $terminal_with alsamixer
    binde = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+
    binde = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-
    bind = SHIFT, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    bind = SHIFT, XF86AudioPlay, exec, playerctl --player=spotify,firefox,%any play-pause
    bind = SHIFT, XF86AudioPrev, exec, playerctl --player=spotify,firefox,%any previous
    bind = SHIFT, XF86AudioNext, exec, playerctl --player=spotify,firefox,%any next

    # mpd
    bind = , XF86AudioPlay, exec, mpc toggle
    bind = , XF86AudioNext, exec, mpc next
    bind = , XF86AudioPrev, exec, mpc prev
    binde = SHIFT, XF86AudioRaiseVolume, exec, mpc volume +2
    binde = SHIFT, XF86AudioLowerVolume, exec, mpc volume -2

    # screenshots
    bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
    bind = SHIFT, Print, exec, grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy

    # power
    bind = SUPER, F12, exec, loginctl lock-session
    bind = SUPER, XF86ScreenSaver, exec, loginctl lock-session

    # start
    ${
    if builtins.hasAttr "wall" theme.hyprland
    then "exec-once = hyprpaper"
    else ""
  }
    # exec-once = hyprctl setcursor capitaine-cursors-white 32
    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once = wl-paste --watch cliphist store
    # exec-once = swayidle -w timeout 300 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1; swaylock -f' timeout 310 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
    exec-once = hypridle
    # exec-once = ironbar
    exec-once = swaync

    # environment variables
    env = XDG_CURRENT_DESKTOP,Hyprland
    env = XDG_SESSION_TYPE,wayland
    env = XDG_SESSION_DESKTOP,Hyprland
    env = NIXOS_OZONE_WL,1

    ${
    if profile == "nyx"
    then ''
      env = LIBVA_DRIVER_NAME,nvidia
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    ''
    else ""
  }

    # env = WLR_DRM_NO_ATOMIC,1
    # env = WLR_NO_HARDWARE_CURSORS,1

    env = GDK_BACKEND,wayland,x11
    env = SDL_VIDEODRIVER,wayland
    env = CLUTTER_BACKEND,wayland

    env = QT_AUTO_SCREEN_SCALE_FACTOR,1
    env = QT_QPA_PLATFORM,wayland;xcb
    env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
    env = QT_QPA_PLATFORM,wayland;xcb
    env = QT_QPA_PLATFORMTHEME,qt5ct

    # cursors
    env = HYPRCURSOR_THEME, capitan-light
    env = HYPRCURSOR_SIZE, 32
    env = XCURSOR_THEME, capitaine-cursors-white
    env = XCURSOR_SIZE, 32
''
