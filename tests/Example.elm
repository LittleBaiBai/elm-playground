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
                                        <&&> (atIndex 0 ((checkHaha "haha0") <&&> (checkHoho "hoho0")))
                                        <&&> (atIndex 1 ((checkHaha "haha1") <&&> (checkHoho "hoho1")))
                                        <&&> (atIndex 2 ((checkHaha "haha2") <&&> (checkHoho "hoho2")))
                                        <&&> (atIndex 3 ((checkHaha "haha3") <&&> (checkHoho "hoho3")))
                                        <&&> (atIndex 4 ((checkHaha "haha4") <&&> (checkHoho "hoho4")))
                                        <&&> (atIndex 5 ((checkHaha "haha5") <&&> (checkHoho "hoho5")))
                                    )
                                )
                ]
            ]
