import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Util.SpawnOnce ( spawnOnce )
import XMonad.Hooks.SetWMName
import qualified XMonad.StackSet as W
import XMonad.Hooks.InsertPosition (insertPosition, Focus(Newer), Position(End))

myBorderWidth   = 2
myNormalBorderColor  = "#3b4252"
myFocusedBorderColor = "#bc96da"

myTerminal      = "wezterm"

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    , insertPosition End Newer -- open new windows at the end
    ]

myStartupHook = do
  spawn "xsetroot -cursor_name left_ptr"
  spawn "setxkbmap -layout 'us,no' -variant colemak,colemak -option 'grp:shifts_toggle'"
  spawnOnce "nitrogen --restore"
  spawnOnce "picom --experimental-backends"
  spawnOnce "dunst"
  setWMName "LG3D"

rofi_launcher = spawn "rofi -show run"
flameshotcmd = spawn "flameshot gui"
shootercmd = spawn "xfce4-screenshooter"

main = do
    xmproc0 <- spawnPipe ("xmobar -x 0 ~/.config/xmobar/xmobarrc")
    xmproc1 <- spawnPipe ("xmobar -x 1 ~/.config/xmobar/xmobarrc")
    xmonad $ docks def
        { manageHook = myManageHook <+> manageHook def -- make sure to include myManageHook definition from above
        , layoutHook = avoidStruts  $  layoutHook def
        , startupHook = myStartupHook
        , terminal = myTerminal
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x   -- xmobar on monitor 1
                                        >> hPutStrLn xmproc1 x   -- xmobar on monitor 2
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask, xK_p), rofi_launcher)
        , ((mod4Mask, xK_Print), shootercmd)
        , ((0, xK_Print), flameshotcmd)
        , ((mod4Mask .|. controlMask, xK_x), spawn "exec ~/.local/bin/apps.sh")
        , ((mod4Mask .|. controlMask, xK_u), spawn "exec ~/.local/bin/utils.sh")
        , ((mod4Mask .|. shiftMask, xK_q), spawn "exec ~/.local/bin/xm/powermenu.sh")
        , ((mod4Mask, xK_Print), shootercmd)
        , ((mod4Mask, xK_Print), shootercmd)
        -- Overrides because I like these better
        , ((mod4Mask, xK_Return), spawn "wezterm")
        , ((mod4Mask .|. shiftMask, xK_Return), windows W.swapMaster)
        -- Overrides for Colemak-friendly usage
        , ((mod4Mask, xK_k), refresh)
        , ((mod4Mask, xK_n), windows W.focusDown)
        , ((mod4Mask, xK_e), windows W.focusUp)
        , ((mod4Mask .|. shiftMask, xK_n), windows W.swapDown)
        , ((mod4Mask .|. shiftMask, xK_e), windows W.swapUp)
        ]
