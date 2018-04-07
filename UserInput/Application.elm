module Application exposing (..)
import Html exposing (beginnerProgram, div, button, text, hr)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)

-- main est la fonction de point d'entrée
main =
  -- La fonction beginnerProgram permet d'appeler les 3 élements de l'architecture elm (model, view, update)
  -- On initialise la valeur du model à 0
  beginnerProgram { 
    model = model
    , view = view
    , update = update 
    }


-- MODEL

type alias Model =
  { valeur : Int, bouton : String }


model : Model
model =
  Model 0 "x"


-- VIEW

view model =
  div [ class "container m-2", myStyle ]
    [ div [ class "row" ]
        [ button [ class (if model.bouton == "x" then "btn btn-info mr-2" else "btn mr-2") , onClick Reset ] [ text "x" ]
        , button [ class (if model.bouton == "-" then "btn btn-warning mr-2" else "btn mr-2") , onClick Decrement ] [ text "-" ]
        , button [ class (if model.bouton == "+" then "btn btn-danger mr-2" else "btn mr-2") , onClick Increment ] [ text "+" ]
        ]
    , div [ class "row" ]
        [ div [ class "d-block alert alert-info m-2"] [ text (toString model.valeur) ]
        ]
    ]

myStyle =
  style
    [ ("width", "200px")
    , ("height", "40px")
    , ("padding", "10px 0")
    , ("font-size", "7em")
    , ("text-align", "center")
    ]
    

-- UPDATE


-- Union Type : On définit un type contenant les actions possibles
type Msg = Increment | Decrement | Reset

-- Conformément aux troisième arguments de beginnerProgram c'est la fonction update
update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model | valeur = model.valeur + 1, bouton = "+" }

    Decrement ->
      { model | valeur = model.valeur - 1, bouton = "-" }

    Reset ->
      { model | valeur = 0, bouton = "x" }