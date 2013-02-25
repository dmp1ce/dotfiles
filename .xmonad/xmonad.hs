import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops   -- fullscreenEventHook fixes chrome fullscreen
import Graphics.X11.ExtraTypes.XF86
import qualified Data.Map        as M

main = xmonad =<< xmobar
  defaultConfig
    { 
      borderWidth = 1
      , handleEventHook    = fullscreenEventHook
      , keys = myKeys
    }

keysToAdd x = [
  ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2-")
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2+")]
keysToDel x = []
newKeys x = M.union (keys defaultConfig x) (M.fromList (keysToAdd x)) 
myKeys x = foldr M.delete (newKeys x) (keysToDel x)
