module FibonacciBars where

import Color exposing (..)
import Fibonacci exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import List exposing (..)
import Text exposing (..)
import Maybe exposing (..)

barColor : Int -> Color
barColor n =
    let colors = [ red, orange, yellow, green, blue, purple, brown ]
    in
        drop (n % (length colors)) colors |> head |> withDefault black

bar (index, n) =
                flow right [
                  collage (n*20) 20 [ filled (barColor index) (rect (toFloat n * 20) 20) ],
                  show n
                ]

main = flow down <| List.map bar (fibonacciWithIndexes 10)
