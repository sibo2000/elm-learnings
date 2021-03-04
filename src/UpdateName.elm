module UpdateName exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    , age : Int
    }


init : Model
init =
    { name = "Simon"
    , age = 35
    }



-- UPDATE


type Msg
    = Increment
    | Decrement
    | ChangeName String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | age = model.age + 1 }

        Decrement ->
            { model | age = model.age - 1 }

        ChangeName val ->
            { model | name = val }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.age) ]
        , div [] [ text model.name ]
        , button [ onClick Increment ] [ text "+" ]
        , input [ type_ "text", onInput ChangeName, placeholder model.name ] []
        ]
