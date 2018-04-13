module TryElmer exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    Int


model : Model
model =
    5


init =
    ( model, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        , table [] tableRows
        ]


mapFunc : Int -> Html msg
mapFunc index =
    tr []
        [ td [ class "haha" ] [ text ("haha" ++ (toString index)) ]
        , td [ class "hoho" ] [ text ("hoho" ++ (toString index)) ]
        ]


tableRows : List (Html msg)
tableRows =
    List.map mapFunc (List.range 0 model)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
