module Application exposing (..)

import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)

-- main est la fonction de point d'entrée
main =
  -- La fonction beginnerProgram permet d'appeler les 3 élements de l'architecture elm (model, view, update)
  -- On initialise la valeur du model à 0
  beginnerProgram { model = { valeur = 0 }, view = view, update = update }


view model =
  div [ class "container m-2" ]
    [ div [ class "row" ]
        [ button [ class "btn btn-info mr-2" , onClick Reset ] [ text "X" ]
        , button [ class "btn btn-warning mr-2" , onClick Decrement ] [ text "-" ]
        , button [ class "btn btn-success" , onClick Increment ] [ text "+" ]
        , div [ class "d-block alert alert-info m-2"] [ text (toString model.valeur) ]
        ]
    ]


-- Union Type : On définit un type contenant les actions possibles
type Msg = Increment | Decrement | Reset

-- Conformément aux troisième arguments de beginnerProgram c'est la fonction update
update msg model.valeur =
  case msg of
    Increment ->
      model.valeur + 1

    Decrement ->
      model.valeur - 1

    Reset ->
      0