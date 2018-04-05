**Developper une application monopage (SPA) avec Elm**

# Présentation de ELM

ELM est un langage récemment créer par Evan Czaplicki (qu'il présente lors de sa thèse, le 30 mars 2012) et qui suit le paradigme de la programmation fonctionnelle. La programmation fonctionnelle qui est un dérivé de la programmation déclarative dans laquelle on dit "quoi" et on laisse le programme faire le reste (en opposition à la programmation impérative ou on dit plutot "comment" en donnant un ensemble d'instruction à suivre impérativement pour résoudre un problème. Pour le cas de la programmation fonctionnelle, le comment se fera en se basant sur le principe des fonctions mathématiques qui se veulent être courte, simple, et ne font qu'une chose à la fois (single responsibility principle).

Fortement inspiré de Haskell ou encore OCaml, ELM se présente comme suit:
- compilation vers JS
- Focus sur le Front end
- Focus sur la simplicité
- Focus sur la FRP (Programmation fonctionnelle réactive)

Il est donc fonctionnel, s'accordant ainsi avec l'immutabilité ou les fonctions pures, le système est fortement typé et on utilise une syntaxe ML (Meta language). Il permet de réaliser du code qui ne subira pas d'erreur à la compilation, facilement refactorable.

## Installation d'elm

```
npm install -g elm
```

ou via yarn

```
yarn global add elm
```

Bien que dans notre cas ici nous installons elm en mode développement juste pour garder dans le fichier package.json la version utilisée, vous devez lancer l'installation en mode global 

Cette installation va vous permettre d'avoir elm et 4 nouvelles commandes

- elm-make: le compilateur
- elm-package: le gestionnaire de paquets
- elm-reactor: pour les tests
- elm-repl: l'interpréteur, REPL (Read, Evaluate, Print, Loop)

Une seule remarque: null n'existe pas! elle est remplacer par le mot clé Maybe. Si un élement attend une valeur int, alors il n'y aura pas de null ou undefined comme en javascript mais la valeur entière 0.

## Premier pas avec elm

Sur le site d'[elm](http://elm-lang.org) vous avez la possibilité de faire quelques tests en vous basant éventuellement sur les nombreux [exemples](http://elm-lang.org/examples) fournis. 

Vous pouvez également tester quelques commandes en local avec le REPL via la commande elm-repl vous devez indiquer un passage à la ligne en finissant votre ligne avec une barre oblique inversé \ (anti-slash en anglais).

Un Résumé (cheat sheet) est disponible [ici](https://github.com/izdi/elm-cheat-sheet), voici quelques commandes très basique elm en utilisant `elm-repl` et dont les commandes sont disponible [ici](https://guide.elm-lang.org/core_language.html).

```
PS D:\labs\elm> npx elm-repl
npx: installed 1 in 21.371s
Path must be a string. Received undefined
D:\labs\elm\node_modules\elm\binwrappers\elm-repl
---- elm-repl 0.18.0 -----------------------------------------------------------
 :help for help, :exit to exit, more at <https://github.com/elm-lang/elm-repl>
--------------------------------------------------------------------------------
> 1 + 1
2 : number
> "test"
"test" : String
> "test " ++ "de " ++ "elm"
"test de elm" : String
> False && True
False : Bool
> False || True
True : Bool
> add a b = a + b
<function> : number -> number -> number
> add 2 3
5 : number
> notes = [ 18 , 17 , 19 , 15 , 18 ]
[18,17,19,15,18] : List number
> List.sum notes
87 : number
> List.append notes [17]
[18,17,19,15,18,17] : List number
> 20 :: notes
[20,18,17,19,15,18] : List number
> developpeur = { nom = "Benfarhat", prenom = "Elyes" }
{ nom = "Benfarhat", prenom = "Elyes" } : { nom : String, prenom : String }
> developpeur.nom
"Benfarhat" : String
> 1 + \
| 3
4 : number
> :exit
PS D:\labs\elml>
```

Observez également la qualité des messages d'erreur, il ne manque plus qu'il nous corrige lui même le code:

```
> no True
-- NAMING ERROR ---------------------------------------------- repl-temp-000.elm

Cannot find variable `no`

3|   no True
     ^^
Maybe you want one of the following?

    not
    Basics.not

> not True
False : Bool
>
```

## Première application elm

Nous allons créer notre premier application et utiliser `elm-package` pou intaller le module html

```
PS D:\labs\elm> npx elm-package install elm-lang/html
npx: installed 1 in 2.468s
Path must be a string. Received undefined
D:\labs\elm\node_modules\elm\binwrappers\elm-package
Some new packages are needed. Here is the upgrade plan.

  Install:
    elm-lang/core 5.1.1
    elm-lang/html 2.0.0
    elm-lang/virtual-dom 2.0.4

Do you approve of this plan? [Y/n] Y
Starting downloads...

  ÔùÅ elm-lang/virtual-dom 2.0.4
  ÔùÅ elm-lang/html 2.0.0

ÔùÅPackages configured successfully!
 elm-lang/core 5.1.1
PS D:\labs\elm>
```
Si vous tracker vos modifications avec git alors dans votre fichier `.gitignore` mettez ces deux lignes:

```
node_modules
elm-stuff
```
Ensuite créeons un fichier avec l'extension elm appelons le Application.elm dans lequel vous mettrez le code suivant:

```
module Application exposing (..)

import Html exposing (text)


main =
    text "Mon application"
```

Tout d'abord dans elm nous avons de préférence du code simple dans un fichier qui va contenir ce qu'on appelle module (ou une partie de l'application), dans la première ligne vous devait lire "ce module Application expose tout" (.. représente tout)
Ensuite on appelle la fonction text du module html pour dans notre main afficher le texte "Mon application"

Pour exécuter ceci nous allons lancer la commande: 

```
PS D:\labs\elm> npx elm-reactor
npx: installed 1 in 2.525s
Path must be a string. Received undefined
D:\labs\elm\node_modules\elm\binwrappers\elm-reactor
elm-reactor 0.18.0
Listening on http://localhost:8000
```

Puis comme il est indiqué on se rend via notre navigateur sur l'adresse http://localhost:8000 pour voir la liste des fichier de ce répertoire, il suffit de cliquer sur le fichier Application.elm ou se rendre à l'adresse http://localhost:8000/Application.elm, pour qu'après transformation votre page web affiche le texte "Mon application" avec le code source suivant:

```
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>~/Application.elm</title>
<style type="text/css">@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro);
html, head, body {
  margin: 0;
  height: 100%;
}
</style>
</head>
<body>
<div style="width: 100%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center; color: #9A9A9A; font-family: &#39;Source Sans Pro&#39;;">
<div style="font-size: 3em;">Building your project!</div>
<img src="/_reactor/waiting.gif">
<div style="font-size: 1em">With new projects, I need a bunch of extra time to download packages.
</div>
</div>
</body>
<script src="/_compile/Application.elm" charset="utf-8">
</script>
<script>while (document.body.firstChild) {
    document.body.removeChild(document.body.firstChild);
}
runElmProgram();
</script>
</html>
```
A présent modifions un peu notre application en utilisant le module string pour inverser notre texte, le code sera le suivant: 

```
module Application exposing (..)

import Html exposing (text)
import String

message = "Mon application"
main =
    text(String.reverse message)
```

### Intégrer de l'elm dans une page html

Prenons la template starter de bootstrap que nous allons insérer dans le fichier index.html, sous le répertoire Application:

```
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>

```
