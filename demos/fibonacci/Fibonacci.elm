module Fibonacci where


import List exposing (..)
import Maybe exposing (..)

fibonacci : Int -> List Int
fibonacci goal =
   let fibonacci1 n a b fibs =
           if n >= goal
               then reverse fibs
               else fibonacci1 (n+1) (a+b) a (a::fibs)
   in
       fibonacci1 0 1 0 []

teste : Int -> Int
teste n = reverse(fibonacci n) |> head |> withDefault 0



fibonacciWithIndexes : Int -> List (Int,Int)
fibonacciWithIndexes n = map2 (,) [0..n] (fibonacci n)
