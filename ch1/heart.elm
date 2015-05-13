import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)


main =
  Signal.map heartBeat (every millisecond)

heartBeat t = collage 300 300 [heart |> scale (abs(sin(t/100)))]


heart = group [ move (0,0) (filled red (ngon 4 50))
                 , move (21,20) (filled red (circle 35))
                 , move (-21,20) (filled red (circle 35))]
