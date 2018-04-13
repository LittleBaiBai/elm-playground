module Example exposing (..)

import TryElmer
import Expect exposing (Expectation)
import Elmer exposing (..)
import Elmer.Html exposing (target, expect, HtmlElement)
import Elmer.Html.Element
import Elmer.Html.Matchers exposing (element, elements, hasText)
import Test exposing (..)


suite : Test
suite =
    let
        initialState =
            Elmer.given TryElmer.model TryElmer.view TryElmer.update

        checkHaha : String -> HtmlElement msg -> Expectation
        checkHaha text msg =
            msg
                |> Elmer.Html.Element.target ".haha"
                |> (element <| Elmer.Html.Matchers.hasText text)

        checkHoho : String -> HtmlElement msg -> Expectation
        checkHoho text msg =
            msg
                |> Elmer.Html.Element.target ".hoho"
                |> (element <| Elmer.Html.Matchers.hasText text)

        checkRow : Int -> Matcher (List (HtmlElement msg))
        checkRow index =
            atIndex index
                ((checkHaha ("haha" ++ (toString index)))
                    <&&> (checkHoho ("hoho" ++ (toString index)))
                )
    in
        describe "my app"
            [ describe "initial state"
                [ test "table rows" <|
                    \() ->
                        initialState
                            |> target "tr"
                            |> expect
                                (elements <|
                                    ((hasLength 6)
                                        <&&> checkRow 0
                                        <&&> checkRow 1
                                        <&&> checkRow 2
                                        <&&> checkRow 3
                                        <&&> checkRow 4
                                        <&&> checkRow 5
                                    )
                                )
                ]
            ]
