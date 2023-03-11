import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Util.SpawnOnce ( spawnOnce )
import XMonad.Hooks.SetWMName
import XMonad.Layout.IndependentScreens
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Hooks.InsertPosition (insertPosition, Focus(Newer), Position(End))

myBorderWidth   = 2
myNormalBorderColor  = "#3b4252"
myFocusedBorderColor = "#bc96da"

-- Hacky color scheme

colorScheme = "doom-one"

colorBack = "#282c34"
colorFore = "#bbc2cf"

color01 = "#1c1f24"
color02 = "#ff6c6b"
color03 = "#98be65"
color04 = "#da8548"
color05 = "#51afef"
color06 = "#c678dd"
color07 = "#5699af"
color08 = "#202328"
color09 = "#5b6268"
color10 = "#da8548"
color11 = "#4db5bd"
color12 = "#ecbe7b"
color13 = "#3071db"
color14 = "#a9a1e1"
color15 = "#46d9ff"
color16 = "#dfdfdf"

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
  spawnOnce "xdotool key Super+w"
  spawnOnce "xdotool key Super+1"

rofi_launcher = spawn "rofi -show drun -icon-theme 'Papirus' -show-icons"
flameshotcmd = spawn "flameshot gui"
shootercmd = spawn "xfce4-screenshooter"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_k     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_n     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_e     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_n     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_e     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{f,w}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{f,w}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_f, xK_w] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


main = do
    xmproc0 <- spawnPipe ("xmobar -x 0 ~/.config/xmobar/xmobarrc")
    xmproc1 <- spawnPipe ("xmobar -x 1 ~/.config/xmobar/xmobarrc")
    xmonad $ docks def
        { manageHook = myManageHook <+> manageHook def -- make sure to include myManageHook definition from above
        , layoutHook = avoidStruts  $  layoutHook def
        , startupHook = myStartupHook
        , terminal = myTerminal
        , workspaces = withScreens 2 ["1", "2", "3"]
        , keys = myKeys
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x   -- xmobar on monitor 1
                                        >> hPutStrLn xmproc1 x   -- xmobar on monitor 2
                        , ppCurrent = xmobarColor color06 "" . wrap
                                    ("<box type=Bottom width=2 mb=2 color=" ++ color06 ++ ">") "</box>"
                        -- Visible but not current workspace
                        , ppVisible = xmobarColor color06 ""
                        -- Hidden workspace
                        , ppHidden = xmobarColor color05 "" . wrap
                                   ("<box type=Top width=2 mt=2 color=" ++ color05 ++ ">") "</box>"
                        -- Hidden workspaces (no windows)
                        , ppHiddenNoWindows = xmobarColor color05 ""
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask, xK_p), rofi_launcher)
        , ((mod4Mask, xK_Print), shootercmd)
        , ((0, xK_Print), flameshotcmd)
        , ((mod4Mask .|. controlMask, xK_x), spawn "exec ~/.local/bin/apps.sh")
        , ((mod4Mask .|. controlMask, xK_u), spawn "exec ~/.local/bin/utils.sh")
        , ((mod4Mask .|. controlMask, xK_e), spawn "rofi -modi emoji -show emoji -kb-custom-1 Ctrl+C")
        , ((mod4Mask .|. shiftMask, xK_q), spawn "exec ~/.local/bin/powermenu")
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
