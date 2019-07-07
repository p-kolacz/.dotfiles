import XMonad
import XMonad.Layout.Spacing

-- Utils
import XMonad.Util.EZConfig (additionalKeysP) -- https://hackage.haskell.org/package/xmonad-contrib-0.13/docs/XMonad-Util-EZConfig.html
import XMonad.Util.SpawnOnce
import XMonad.Util.Run (spawnPipe)

-- HOOKS
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog -- for spawning xmobar http://hackage.haskell.org/package/xmonad-contrib-0.15/docs/XMonad-Hooks-DynamicLog.html

-- main = do
  -- xmproc0 <- spawnPipe "xmobar ~/.dotfiles/xmobar/bar01.hs" -- xmobar
  -- xmonad myConfig
  
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
-- main = xmonad =<< xmobar myBar myConfig

-- Command to launch the bar.
myBar = "xmobar ~/.dotfiles/xmobar/bar01.hs"
-- myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP --  { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.

-- main = do
  -- xmonad $ def
myConfig = defaultConfig
  { modMask            = myMod
  , terminal           = myTerminal
  , startupHook        = myStartupHook
  , layoutHook         = myLayoutHook 
    -- , workspaces         = myWorkspaces
    -- , borderWidth        = myBorderWidth
    -- , normalBorderColor  = "#292d3e"
    -- , focusedBorderColor = "#bbc5ff"
  } `additionalKeysP` myKeys 

myMod = mod4Mask
myTerminal = "kitty"

----------
-- Keys
myKeys =
  [ ("M-<Return>", spawn myTerminal)
  , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")      -- Recompiles xmonad
  , ("M-q", kill)                           -- Kill the currently focused client
  , ("M-d", spawn "rofi -show run")
  ]

--------------
-- Autostart
myStartupHook = do
  -- spawn "~/.config/polybar/polybar.sh"
  spawnOnce "nitrogen --restore"
  spawnOnce "compton -b"
  spawnOnce "~/.dotfiles/xorg/scripts/kb-setup.sh"
  spawnOnce "xbindkeys"
  spawnOnce "nm-applet"
  spawnOnce "sparkleshare"
  spawnOnce "dropbox"

--------------
-- Layout
-- myLayoutHook = avoidStruts $ layoutHook defaultConfig
-- myLayoutHook = layoutHook defaultConfig

-- myLayoutHook = gaps [(U,18), (R,23)] $ Tall 1 (3/100) (1/2) ||| Full  -- leave gaps at the top and right
myLayoutHook = smartSpacing 8 $ layoutHook defaultConfig
