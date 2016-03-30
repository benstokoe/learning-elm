import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Signal exposing (..)
import String exposing (..)
import StartApp.Simple as StartApp

main =
  StartApp.start { model = emptyModel, update = update, view = view }

-- MODEL

type alias Model = { name : String }

emptyModel : Model
emptyModel =
  Model ""

-- ACTIONS

type Action
  = Name String

update : Action -> Model -> Model
update action model =
  case action of
    Name name ->
      { model | name = name }

-- VIEW

view : Address Action -> Model -> Html
view address model =
  div []
  [ input
    [ type' "text"
    , placeholder "What is your name?"
    , name "name"
    , on "input" targetValue (\name -> Signal.message address (Name name))
    ]
    [],
    div [] [ nameMessage (toString model.name) ]
  ]

nameMessage : String -> Html
nameMessage name=
  if (length name) == 2 then
    p [] [ text "Please enter your name" ]
  else 
    p [] [ text ("Your name is: " ++ name) ]
