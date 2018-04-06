module Application exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Bienvenue sur notre Blog!" ]
        , p []
            [ text "Cette page est une démonstration d'intégration d'"
            , span [ class "text-danger"] [ text "elm" ]
            , text ". Nous allons essayez d'en faire plus dans les étapes à venir"
            ]
        ]


main =
    view "ma page"