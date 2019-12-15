module InfraUI where

import Graphics.Vty.Input.Events
import Graphics.Vty.Attributes
import Brick.AttrMap
import Brick.Main
import Brick.Types
import Brick.Widgets.Core

type State = Int

type OurApp = App State () ()

ourApp :: OurApp
ourApp = App {
  appDraw = draw,
  appChooseCursor = neverShowCursor,
  appHandleEvent = eventsHandler,
  appStartEvent = pure,
  appAttrMap = const $ attrMap defAttr []
             }

draw :: State -> [Widget ()]
draw s = [str $ show s]

eventsHandler :: State -> BrickEvent n e -> EventM n (Next State)
eventsHandler s (VtyEvent (EvKey (KChar 'j') [])) = continue $ s - 1
eventsHandler s (VtyEvent (EvKey (KChar 'k') [])) = continue $ s + 1
