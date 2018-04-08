-- module Main exposing (..)

import Http
import Http.Progress as Progress exposing (Progress(..))
import Html exposing (..)
import Html.Events exposing (onCheck)
import Html.Attributes exposing (..)
import Json.Decode as Decode



main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


init : ( Model, Cmd a )
init = ( initModel, Cmd.none )



-- Model


type alias Model =
  { progress : Progress String
  , dataUrl : Maybe String
  , dataContent : String
  }


initModel : Model
initModel =
  { progress = Progress.None
  , dataUrl = Nothing
  , dataContent = ""
  }



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
  case model.dataUrl of
    Just dataUrl ->
      Http.getString dataUrl
        |> Progress.track dataUrl GetDataProgress

    Nothing ->
      Sub.none



-- Update


type Msg
  = NoOp
  | GetData String
  | GetDataProgress (Progress String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )
    {- 
    SetData (Done dataContent) ->
      ( { model | dataUrl = Just url}, dataContent = dataContent )
    -}
    
    GetData url ->
      ( { model | dataUrl = Just url}, Cmd.none )

    GetDataProgress (Done dataContent) ->
      ( { model
          | progress = Done ""
          , dataContent = dataContent
        }
      , Cmd.none )

    GetDataProgress (Fail error) ->
      ( { model
          | progress = Fail error
          , dataContent = toString error
        }
      , Cmd.none )

    GetDataProgress progress ->
      ( { model | progress = progress }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
  div [ viewStyle ]
    [ h1 [] [ text "Elm HTTP Client - Random User" ]
    , p []
        [ text "Random User:"
        , inputRadio "Random User" "https://randomuser.me/api/?results=500"
        ]
    , progressView
        <| toString
        <| progressLoaded model.progress
    , dataContentView model.dataContent
    , footerView
    ]


inputRadio : String -> String -> Html Msg
inputRadio labelText url =
  div []
    [ label
        [ onCheck (\isChecked ->
            if isChecked
            then GetData url
            else NoOp)
        ]
        [ input [ type_ "radio", name "data-radio" ] []
        , text labelText
        ]
    ]


progressView : String -> Html Msg
progressView loaded =
  div []
    [ span [] [ text "Progression: " ]
    , progress
        [ value loaded
        , Html.Attributes.max "100"
        ]
        [ text <| loaded ++ "%" ]
    , text <| loaded ++ "%"
    ]


progressLoaded : Progress String -> Int
progressLoaded progress =
  case progress of
    Some { bytes, bytesExpected } ->
      round
        <| (*) 100
        <| toFloat bytes / toFloat bytesExpected

    Done _ ->
      100

    _ -> -- None or Fail case
      0


dataContentView : String -> Html Msg
dataContentView valueText =
  div []
    [ textarea
        [ value valueText
        , disabled True
        , dataContentViewStyle
        ]
        []
    ]


footerView : Html Msg
footerView =
  span [ footerViewStyle ]
    [ text "Inspiré de "
    , a [ href "https://gist.github.com/pablohirafuji/fa373d07c42016756d5bca28962008c4"
        , target "_blank"
        ]
        [ text "Source" ]
    , text " | "
    , text "Par "
    , a [ href "https://github.com/Benfarhat"
        , target "_blank"
        ]
        [ text "Benfarhat Elyes" ]
    ]



-- Styles


viewStyle : Attribute Msg
viewStyle =
  style
    [ ("display", "flex")
    , ("flex-direction", "column")
    , ("width", "550px")
    , ("margin", "0 auto")
    , ("font-family", "Arial")
    ]


dataContentViewStyle : Attribute Msg
dataContentViewStyle =
  style
    [ ("height", "400px")
    , ("width", "100%")
    ]
    
footerViewStyle : Attribute Msg
footerViewStyle =
  style
    [ ("font-size", "0.9em")
    , ("width", "100%")
    , ("text-align", "center")
    ]
