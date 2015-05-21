
import Graphics.Element exposing (..)
import Mouse


main : Signal Element
main =
  Signal.map resizeableYogi


resizeableYogi : Int -> Element
resizeableYogi n =
  tiledImage n n "borga.jpg"


edgeLength : Signal Int
edgeLength =
  Signal.map (\(x,y) -> max x y) Mouse.position
