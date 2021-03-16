module UpdateNameButton exposing (..)

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
    , form : Form
    }


init : Model
init =
    { name = "Simon"
    , form = form
    }


type alias Form =
    { key1 : String
    , key2 : String
    }


form : Form
form =
    { key1 = ""
    , key2 = ""
    }



-- UPDATE


type Msg
    = StashName String
    | UpdateName


update : Msg -> Model -> Model
update msg model =
    case msg of
        StashName val ->
            -- Cant Updating a nested record
            -- { model.form | name = val }            

        UpdateName ->
            { model | name = model.form.key1 }




view : Model -> Html Msg
view model =
    div []
        [ div [] [ text model.name ]
        , input [ type_ "text", onInput StashName ] []
        , button [ onClick UpdateName ] [ text "Save" ]
        ]
