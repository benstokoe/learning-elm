import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Signal exposing (Mailbox)

view : Signal.Address String -> String -> Html
view address message =
  div []
  [ input
    [ type' "string"
    , placeholder "What is your name?"
    , name "name"
    , on "input" targetValue (\v -> Signal.message address v)
    ]
    [],
    p [] [ text ("Your name is: " ++ message) ]
  ]

inbox : Mailbox String
inbox =
  Signal.mailbox ""

main : Signal Html
main =
  Signal.map (view inbox.address) inbox.signal
