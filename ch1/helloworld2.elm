module HelloWorld2 where

import Color
import Graphics.Element exposing (..)
import Text
import Markdown

makeGreen : Text.Text -> Text.Text
makeGreen = Text.color Color.green

main  : Element
main  = Markdown.toElement """

#Hello World
Markdown test

"""
    -- Text.fromString "Hello World"
    -- |> makeGreen
    -- |> Text.italic
    -- |> Text.bold
    -- |> Text.height 150
    -- |> Graphics.Element.leftAligned
