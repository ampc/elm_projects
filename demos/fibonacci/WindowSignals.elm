module WindowSignals where

import Graphics.Element exposing (..)
import List exposing (..)
import Signal exposing (..)
import Text exposing (..)
import Window

showsignals a b c =
  flow down <| List.map show [
                              "Window.dimensions " ++ toString a,
                              "Window.width " ++ toString b ,
                              "Window.height " ++ toString  c
                            ]

main =
     showsignals
         <~ Window.dimensions
         ~ Window.width
         ~ Window.height
