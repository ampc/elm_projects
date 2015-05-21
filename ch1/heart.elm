import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)
import Mouse
import Basics exposing (..)

main =
  Signal.map heartBeat ( Signal.map toFloat Mouse.x)

heartBeat t = collage 1000 768 [heart |> scale (abs(sin(t/100)))]


heart = group [ move (0,0) (filled red (ngon 4 50))
                 , move (21,20) (filled red (circle 35))
                 , move (-21,20) (filled red (circle 35))]


--mouseF : Signal Int -> Int -> Floar
--mouseF
