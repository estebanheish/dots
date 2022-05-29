import XMonad
import qualified XMonad.StackSet as W
import System.Exit (exitWith, ExitCode(ExitSuccess))

import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Actions.CycleWS (nextScreen, prevScreen, shiftNextScreen, shiftPrevScreen)
import XMonad.Actions.Warp (warpToScreen)

-- bar 
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- fullscreen bind
import qualified XMonad.Layout.MultiToggle as MT
import XMonad.Layout.MultiToggle (mkToggle, single)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL))
import XMonad.Hooks.ManageDocks 

-- swallowing
import XMonad.Hooks.WindowSwallowing

main :: IO ()
main = xmonad
     . ewmh 
     . withEasySB mySB defToggleStrutsKey
     $ myConfig

-- vars
myTerminal = "alacritty"
myBrowser = "qutebrowser"
myBrowser' = "firefox"

myMenu = "bemenu-run -H 19 --fn 'Ubuntu Bold 11'"
      ++ " --tb '#000000'"
      ++ " --hb '#000000'"
      ++ " --fb '#000000'"
      ++ " --sb '#000000'"
      ++ " --nb '#000000'"
      ++ " --scb '#000000'"
      ++ " --hf '" ++ focusColor ++ "'"
      ++ " -p ''"

focusColor = "#6f64fc"
normalColor = "#1C1B1A"
-- 

-- Startup hook
myStartupHook = do 
  spawnOnce "xrandr --output DP-2 --primary --mode 1920x1080 --rate 239.76 --right-of DP-0"
  spawnOnce "~/.fehbg &"
  spawnOnce "dusnt &"
-- 

-- layouts
myLayouts = avoidStruts $ mkToggle (single NBFULL) (tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

-- xmobar 
mySB = statusBarProp "xmobar" (pure myPP)
myPP = def { ppCurrent = xmobarColor focusColor "" . wrap "[" "]" 
           , ppTitle   = xmobarColor "green" "" . shorten 40
           , ppVisible = wrap "(" ")"
           , ppUrgent  = xmobarColor "red" "yellow"
           }
-- 

-- handleEventHook
myHandleEventHook = swallowEventHook (className =? "Alacritty" <||> className =? "alacritty") (return True)
--

myConfig = def
  { modMask = mod4Mask  -- Rebind Mod to the Super key
  , borderWidth = 2
  , terminal = myTerminal
  , startupHook = myStartupHook
  , layoutHook = myLayouts
  , focusedBorderColor = focusColor
  , normalBorderColor = normalColor
  , handleEventHook = myHandleEventHook
  }
  `additionalKeysP`
  [ 
    ("M-s", spawn myMenu)
  , ("M-w", spawn myBrowser)
  , ("M-S-w", spawn myBrowser')
  , ("M-S-q", kill)
  , ("M-S-c", io (exitWith ExitSuccess)) -- %! Quit xmonad
  , ("M-c", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi") -- %! Restart xmonad
  , ("M-u", sendMessage (IncMasterN 1)) -- %! Increment the number of windows in the master area
  , ("M-y", sendMessage (IncMasterN (-1))) -- %! Deincrement the number of windows in the master area
  , ("M-f", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- toggle fullscreen

  -- colemak hjkl
  , ("M-n", windows W.focusDown) -- %! Move focus to the next window -- J
  , ("M-e", windows W.focusUp) -- %! Move focus to the previous windowk
  , ("M-S-n", windows W.swapDown) -- %! Swap the focused window with the next window 
  , ("M-S-e", windows W.swapUp) -- %! Swap the focused window with the previous window 
  , ("M-i", sendMessage Expand) -- %! Expand the master area 

  -- screen focus
  , ("M-.", nextScreen) -- Switch focus to next monitor
  , ("M-,", prevScreen) -- Switch focus to prev monitor
  , ("M-S-.", shiftNextScreen) -- Move focused window to workspace on next screen
  , ("M-S-,", shiftPrevScreen) -- Move focused window to workspace on prev screen

  -- audio
  , ("<XF86AudioMute>", spawn "pulsemixer --toggle-mute")
  , ("<XF86AudioRaiseVolume>", spawn "pulsemixer --change-volume +2")
  , ("<XF86AudioLowerVolume>", spawn "pulsemixer --change-volume -2")
  , ("S-<XF86AudioMute>", spawn "amixer set Capture toggle")

  -- screenshots
  , ("<Print>", spawn "maim -s | xclip -selection clipboard -t image/png")

  -- power 
  , ("M-<F10>", spawn "betterlockscreen -l dimblur")
  , ("M-<F11>", spawn "systemctl -i reboot")
  , ("M-<F12>", spawn "systemctl -i poweroff")

  -- music player
  , ("<XF86AudioNext>", spawn "cmus-remote -n")
  , ("<XF86AudioPrev>", spawn "cmus-remote -p")
  , ("<XF86AudioPlay>", spawn "cmus-remote -u")
  , ("S-<XF86AudioRaiseVolume>", spawn "cmus-remote -v +2%")
  , ("S-<XF86AudioLowerVolume>", spawn "cmus-remote -v -2%")
  ] 

