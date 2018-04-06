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

Pour quitter le REPL nous devons taper la commande :exit ou faire la combinaison de touche CTRL + d

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

Remarque: Comme pour tout REPL, vous receverais toujours une valeur de retour, même si vous ne demandez aucun affichage, le format sera `[VALEUR] : [TYPE]`

Avant de finir, pour tester vos codes en ligne, le site [ellie](https://ellie-app.com/new) semble très bien fait et offre une interface plus complete que la partie try de elm.lang

### Quelques bases

#### L'affectation et Records

L'affectation se fait avec le signe égal (=). Pour noter (et non affecter) les valeurs à l'intérieur des records (l'équivalent des objets en javascript) on utilise les deux points.

```
> a = 5
5 : number
> b = "Salut"
"Salut" : String
> c = { paradigme = "fonctionnelle", language = "elm" , naissance = 2012 }
{ paradigme = "fonctionnelle", language = "elm", naissance = 2012 } : { language : String, naissance : number, paradigme : String }
> c.paradigme
"fonctionnelle" : String
>
```

Vous pouvez faire une liste de records  (voir [doc officielle](http://elm-lang.org/docs/records))


```
> bill = { nom = "Gates", societe = "microsoft" }
{ nom = "Gates", societe = "microsoft" } : { nom : String, societe : String }
> steve = { nom = "Jobs", societe = "apple" }
{ nom = "Jobs", societe = "apple" } : { nom : String, societe : String }
> larry = { nom = "Page", societe = "google" }
{ nom = "Page", societe = "google" } : { nom : String, societe : String }
> people = [ bill, steve, larry ]
[{ nom = "Gates", societe = "microsoft" },{ nom = "Jobs", societe = "apple" },{ nom = "Page", societe = "google" }] : List { nom : String, societe : String }
>
```

#### Accès aux élements d'un record

il y a deux facons:

`record.element`

ou

`.element record`

```
> bill.nom
"Gates" : String
> .nom bill
"Gates" : String
>
```


#### Immutabilité

L'immutabilité est un des concepts clé de la programmation fonctionnelle, cela conciste à ne pas permettre le changement d'état mais de créer une sorte de copie. Et donc d'éviter les effets de bords (et donc si un record est utilisé dans une fonction, il ne risque pas d'être modifié en cours de route). L'immutabilité permet d'accéleré 
Dans ce cas nous ne parlons pas d'immutabilité

```
> test1 = 1
1 : number
> test1 = 2
2 : number
>
```


par contre ici si:
```
> test1 = test1 + 1
-- BAD RECURSION --------------------------------------------- repl-temp-000.elm

`test1` is defined directly in terms of itself, causing an infinite loop.

9| test1 = test1 + 1
   ^^^^^
Maybe you are trying to mutate a variable? Elm does not have mutation, so when I
see `test1` defined in terms of `test1`, I treat it as a recursive definition.
Try giving the new value a new name!

Maybe you DO want a recursive value? To define `test1` we need to know what
`test1` is, so letÔÇÖs expand it. Wait, but now we need to know what `test1` is,
so letÔÇÖs expand it... This will keep going infinitely!

To really learn what is going on and how to fix it, check out:
<https://github.com/elm-lang/elm-compiler/blob/0.18.0/hints/bad-recursion.md>


>
```

Les records sont immutables donc pas question de modifier son contenu directement, il faut créer un nouveau record avec les modifications necessaires via le pipe "|":

```
> rec = { val1 = 1, val2 = 2 }
{ val1 = 1, val2 = 2 } : { val1 : number, val2 : number1 }
> rec.val1 = 3
-- SYNTAX PROBLEM -------------------------------------------- repl-temp-000.elm

The = operator is reserved for defining variables. Maybe you want == instead? Or
maybe you are defining a variable, but there is whitespace before it?

7|   rec.val1 = 3
              ^
Maybe <http://elm-lang.org/docs/syntax> can help you figure it out.


> rec.val1 : 3
-- SYNTAX PROBLEM -------------------------------------------- repl-temp-000.elm

A single colon is for type annotations. Maybe you want :: instead? Or maybe you
are defining a type annotation, but there is whitespace before it?

7|   rec.val1 : 3
              ^
Maybe <http://elm-lang.org/docs/syntax> can help you figure it out.


> { rec | val1 = 3 }
{ val1 = 3, val2 = 2 } : { val2 : number1, val1 : number }
> rec
{ val1 = 1, val2 = 2 } : { val1 : number, val2 : number1 }
>
```

Par contre attention a ne pas modifier la structure du record que l'on manipule:

```

> { rec | val1 = "3" }
{ val1 = "3", val2 = 2 } : { val2 : number, val1 : String }
> { rec | champInexistant = 3 }
-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

`rec` is being used in an unexpected way.

7|   { rec | champInexistant = 3 }
       ^^^
Based on its definition, `rec` has this type:

    { val1 : ..., val2 : ... }

But you are trying to use it as:

    { b | champInexistant : ... }

Hint: The record fields do not match up. One has val1 and val2. The other has
champInexistant.


>
```

L'ajout et la suppression de champ ont été implémenté dans la version 0.6 du compilateur elm puis jugé inutile puisque le type "union" permet de le faire

#### Les listes

les listes s'initialisent comme suit:

```
> jours = [ "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche" ]
["mardi","mercredi","jeudi","vendredi","samedi","dimanche"] : List String
>
```
Pour ajouter un élement il faut utiliser la fonction `List.append` ou simplement l'opérateur `::`

```
> "lundi" :: jours
["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"] : List String
```

#### L'opérateur arithmétique de l'addition
le REPL peut être utilisé comme une calculatrice comme nous l'avons fait précédemment, la différence avec javascript par exemple, c'est que ELM utilise un typage statique, en gros quand c'est du texte, c'est du texte, et si c'est un nombre, ca restera un nombre, au niveau de javascript il est possible de faire `1 + 1` ou `true + 1` ou encore `"1" + 1`, c'est javascript qui décidera de comment utiliser le signe "+" et donc du resultat et de son type (ici cela fera 2, 2 et "11"). Avec ELM, il n'y a pas d'ambiguité, un plus (+) restera pour l'addition et non la concatenation de chaine de caractère, pour la concaténation on utilisera plûtot + plus (++), le signe ++ s'applique aux "strings", "text" et "lists".

```
> 1 + 2
3 : number
> True + 1
-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

The left argument of (+) is causing a type mismatch.

3|   True + 1
     ^^^^
(+) is expecting the left argument to be a:

    number

But the left argument is:

    Bool


>
```

Notez que le compilateur utilise ce qu'on appelle l'inférence de type (type inference) pour dans son message vous dire quel type de valeur doit être fournie à droite de l'opérateur ou à gauche

### Les appendables

Voyons le resultat du double signe sur quelques valeurs, nous rappelons qu'Elm est fortement typé, seul les opérandes de types strings, text ou lists peuvent être utilisées.

#### Les opérateurs de la division

Il y a deux signes de division
- / qui rend le résultat de la division exacte
- // qui rend la partie entière (le quotient) de la division euclidienne


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

Puis comme il est indiqué on se rend via notre navigateur sur l'adresse http://localhost:8000 pour voir la liste des fichier de ce répertoire, A droite nous trouvons la version et un résumé du projet (package), pour les modifier il faut se rendre dans le fichier `elm-package.json` et changé les champs `version` et `summary`

Dans la liste affiché, il suffit de cliquer sur le fichier Application.elm ou se rendre à l'adresse http://localhost:8000/Application.elm, pour qu'après transformation votre page web affiche le texte "Mon application" avec le code source suivant:

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

Modifions la balise h1 par une div dans laquelle nous positionnerons le code généré elm:

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
    <div id="elm_root"></div>

    <script src="elm.js"></script>
    <script>
      Elm.Main.embed(document.getElementById("elm_root"));
    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
```

A présent il ne nous manque plus que le code elm.js, nous allons le créer grace à la commande `elm-make Application.elm --output elm.js` :

```
D:\labs\elm\node_modules\elm\binwrappers\elm-make
Success! Compiled 1 module.
Successfully generated elm.js
PS D:\labs\elm\Application>
```

Trois commandes sont possible:

- Elm.fullscreen(Elm.Application, {reset:[]});   // Affichage plein écran
- Elm.embed(Elm.Application, div, {reset:[]});   // Affichage dans une div spécifique
- Elm.worker(Elm.Application,     {reset:[]});   // Instantiation sans graphique

la fonction appelé sans output créerais également le fichier index.html qui intégrera l'output d'elm: `elm-make Application.elm` et si jamais vous désirez avoir un autre nom de fichier il faut simplement faire : `elm-make Application.elm --output autreNomDeFichier.html`
