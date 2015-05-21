import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)
import Mouse
import WebAudio exposing (..)
import Window
import Graphics.Input exposing (..)
import Signal exposing (..)


{--Pulse based on Mouse x coordinate  --}
--main = heartBeat <~ ( toFloat <~  Mouse.x)
{-- Pulse every second--}
main = heartBeat  <~ (every millisecond)
{-- Increase based on mouse clicks --}
--main =  heartBeat <~ ( clickCount)
--main = show (collage 700 700 [heart |> (map scale clickCount)])
--Increase/decrease figure size
heartBeat t =  ( collage 700 700  [heart |> scale (abs(sin(t/100)))])


--Figure
heart =  group [ move (0,0) (filled red (ngon 4 50))
                 , move (21,20) (filled red (circle 35))
                 , move (-21,20) (filled red (circle 35))]




clickCount : Signal Float
clickCount =
   Signal.foldp (\click count -> count + 30.0) 0 Mouse.clicks



{--type alias State = { playing : Bool }

type Action
   = NoOp
   | Play
   | Pause

defaultState = { playing = False }

makeGain x =
   let node = createGainNode DefaultContext
       _ = setValue 0.5 node.gain
   in node |> connectNodes (getDestinationNode DefaultContext) 0 0

defaultGainNode = makeGain 0.8

makeStream url =
   createHiddenMediaElementAudioSourceNode DefaultContext
       |> setMediaElementIsLooping True
       |> setMediaElementSource url
       |> connectNodes defaultGainNode 0 0

streamNode = makeStream "shepards.mp3"

actions : Signal.Mailbox Action
actions = Signal.mailbox NoOp

view : (Int, Int) -> State -> Element
view (w,h) state =
   let label = if state.playing then "Pause" else "Play"
       action = if (not state.playing) then Play else Pause
       msg = Signal.message actions.address action
   in button msg label

-- Updates
update : Action -> State -> State
update action state =
   case action of
     Play ->
         let _ = playMediaElement streamNode
         in { state | playing <- True }
     Pause ->
         let _ = pauseMediaElement streamNode
         in { state | playing <- False }
     NoOp -> state

-- Signals

state : Signal State
state = Signal.foldp update defaultState actions.signal

-- Main

main = Signal.map2 view Window.dimensions state, Signal.map heartBeat (every millisecond)--}
