**Developper une application monopage (SPA) avec Elm**

- [Présentation de ELM](#pr%C3%A9sentation-de-elm)
  - [Installation d'elm](#installation-delm)
  - [Premier pas avec elm](#premier-pas-avec-elm)
    - [Quelques bases](#quelques-bases)
      - [Les noms](#les-noms)
      - [L'opérateur arithmétique de l'addition](#lop%C3%A9rateur-arithm%C3%A9tique-de-laddition)
    - [Prefixe style et infixe stle](#prefixe-style-et-infixe-stle)
        - [Pipe ou chainage des fonctions](#pipe-ou-chainage-des-fonctions)
    - [Les appendables](#les-appendables)
      - [Les Strings](#les-strings)
      - [Les caractères](#les-caract%C3%A8res)
      - [Le multiligne](#le-multiligne)
      - [Les opérateurs de la division](#les-op%C3%A9rateurs-de-la-division)
      - [L'affectation et Records](#laffectation-et-records)
      - [Annotation de Type](#annotation-de-type)
      - [Définition d'un Type](#d%C3%A9finition-dun-type)
      - [Alias de type](#alias-de-type)
      - [Accès aux élements d'un record](#acc%C3%A8s-aux-%C3%A9lements-dun-record)
      - [Immutabilité](#immutabilit%C3%A9)
      - [Les listes](#les-listes)
      - [Map Filter et Foldl / foldr](#map-filter-et-foldl-foldr)
      - [Les Tuples](#les-tuples)
      - [Les commentaires](#les-commentaires)
      - [Les fonctions](#les-fonctions)
        - [Fonctions anonymes](#fonctions-anonymes)
      - [Créer un scope locale](#cr%C3%A9er-un-scope-locale)
      - [Fonctions pures](#fonctions-pures)
      - [Interet des fonctions pures](#interet-des-fonctions-pures)
      - [Curryfication](#curryfication)
      - [Condition if](#condition-if)
      - [Matching case](#matching-case)
- [Création de l'application elm](#cr%C3%A9ation-de-lapplication-elm)
  - [L'architecture d'Elm](#larchitecture-delm)
  - [Première application elm - test](#premi%C3%A8re-application-elm---test)
    - [Intégrer de l'elm dans une page html](#int%C3%A9grer-de-lelm-dans-une-page-html)
    - [Autres application](#autres-application)
      - [Retour sur la création du programme](#retour-sur-la-cr%C3%A9ation-du-programme)
      - [Requêtes HTTP](#requ%C3%AAtes-http)
- [Implémentation](#impl%C3%A9mentation)
  - [Les alias de type](#les-alias-de-type)

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

#### Les noms

Les noms ne peuvent être que comme suit:

- variables / constantes en minucules (camelCase par exemple maPremiereConstante ou en camal_case)
- fonctions en minuscules
- modules et types 

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

L'inférence de type donne donc le type de vos arguments, variables et fonctions mais cela ne veut pas dire qu'il vous est permis comme en javascript de changer dynamiquement de type, celui est statique

### Prefixe style et infixe stle

Dans toutes les opérations vous pouvez théoriquement prendre pour équivalent l'utilisation de l'opérateur entre les opérandes ou en début de ligne

`a OPERATEUR b` équivaut à `(OPERATEUR) a b`

En debut de ligne on parle de préfixe et dans la ligne on parle de infixe

Dans le cas de l'infixe on a cette  équivalence

`(OPERATEUR) a b` équivaut à `a |> OPERATEUR b`

```
> 1 + 2
3 : number
> (+) 1 2
3 : number
> 2 * 3
6 : number
> (*) 2 3
6 : number
> 4 - 5
-1 : number
> (-) 4 5
-1 : number
> "texte1" ++ "texte2"
"texte1texte2" : String
> (++) "texte1" "texte2"
"texte1texte2" : String
> ajout a b = a + b
<function> : number -> number -> number
> ajout 2 3
5 : number
> 2 |> ajout 3
5 : number
```

##### Pipe ou chainage des fonctions

Il est possible d'enchainer l'exécution de fonctions comme suit:

```
import Html exposing (text)
import String

transformTexte string =
  string
    |> String.reverse
    |> String.toUpper

main =
  text (transformTexte "fonctionnel")
```

### Les appendables

Voyons le resultat du double signe plus sur quelques valeurs, nous rappelons qu'Elm est fortement typé, seul les opérandes de types strings, text ou lists peuvent être utilisées.

```
> 1 ++ 1
==================================== ERRORS ====================================

-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

The left argument of (++) is causing a type mismatch.

4|   1 ++ 1
     ^
(++) is expecting the left argument to be a:

    appendable

But the left argument is:

    number

Hint: Only strings, text, and lists are appendable.


> True ++ False
==================================== ERRORS ====================================

-- TYPE MISMATCH --------------------------------------------- repl-temp-000.elm

The left argument of (++) is causing a type mismatch.

4|   True ++ False
     ^^^^
(++) is expecting the left argument to be a:

    appendable

But the left argument is:

    Bool

Hint: Only strings, text, and lists are appendable.


> "Salut " ++ "tout " ++ "le " ++ "Monde"
"Salut tout le Monde" : String
```


#### Les Strings

Comme nous venons de le voir la concaténation de chaine de caractère se fait via les double signe plus (++), d'autres fonctions interessantes sont disponibles comme:

  , isEmpty, length, reverse, repeat, replace, append, concat, split, join, words, lines, slice, left, right, dropLeft, dropRight, contains, startsWith, endsWith, indexes, indices, toInt, fromInt, toFloat, fromFloat, fromChar, cons, uncons, toList, fromList, toUpper, toLower, pad, padLeft, padRight, trim, trimLeft, trimRight, map, filter, foldl, foldr, any, all

  Faisons quelques tests:

```
> mot = "Tunisie"
"Tunisie" : String
> String.toUpper mot
"TUNISIE" : String
> String.reverse mot
"eisinuT" : String
> String.startsWith "T" mot
True : Bool
> String.startsWith "t" mot
False : Bool
> String.contains "z" mot
False : Bool
> String.indices "i" mot
[3,5] : List Int
> String.toList mot
['T','u','n','i','s','i','e'] : List Char
>
```


#### Les caractères

Lorsque nous avons utilisés la fonction toList, on voit qu'on obtient une liste de caractères qui se différencient des string par l'utilisation d'une simple quote (et non les doubles)

```
> "t"
"t" : String
> 't'
't' : Char
```

Les fonctions disponibles sont les suivantes:
isUpper, isLower, isDigit, isOctDigit, isHexDigit, toUpper, toLower, toLocaleUpper, toLocaleLower, KeyCode, toCode, fromCode

```
> import Char
> Char.toCode 'A'
65 : Char.KeyCode
> Char.fromCode 55
'7' : Char
> Char.fromCode 65
'A' : Char
> Char.fromCode 66
'B' : Char
> Char.isUpper 'A'
True : Bool
> Char.isUpper 'a'
False : Bool
>
```
#### Le multiligne
le multiligne peut être délimité par 3 doubles quotes consécutives.

```
import Html exposing (text)

lorem = """

Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Suspendisse sagittis elementum mauris, sit amet faucibus lectus elementum id. 
Nunc vehicula nulla sed tortor consectetur, in fermentum velit varius. 
Maecenas nec tempus nisi. 
Suspendisse cursus, sem sed molestie efficitur, 
lectus dolor lobortis urna, eget imperdiet risus quam sed erat. 
Sed feugiat sem est, ac sodales erat tincidunt et. 
Phasellus quis augue non nisl viverra semper. 
Sed eleifend tellus nec leo efficitur, eget pretium sem ornare. 
Pellentesque et nisl sapien. Nunc consequat est tortor, 
eu bibendum risus finibus nec. 
Donec consectetur condimentum nibh sit amet aliquam. 
Donec a cursus ipsum. Fusce non convallis mi, vel tempus nunc. 
Interdum et malesuada fames ac ante ipsum primis in faucibus.
"""

main =
  text (lorem)
```

#### Les opérateurs de la division

Il y a deux signes de division
- / qui rend le résultat de la division exacte
- // qui rend la partie entière (le quotient) de la division euclidienne
- % qui rend le reste de la division euclidienne

```
> 7/3
2.3333333333333335 : Float
> 7//3
2 : Int
> 7%3
1 : Int
```

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

#### Annotation de Type

Il est possible de prédéfinir le type attendu grace au deux points `:`, c'est de l'nnotation de types

```
import Html exposing (text)

nom : String
nom = "Elyes"

main =
  text ("Bonjour" ++ " " ++ nom)
```

Même chose avec les fonctions:

```
import Html exposing (text)

increment : Int -> Int
increment n =
  n + 1


isNear : Int -> Int -> Bool
isNear x y =
  abs (x - y) < 10

main =
  text (toString (isNear 132 (increment 129)))
```

#### Définition d'un Type

Il est possible de définir un nouveau type comme suit

```
> sofiene = Homme
-- NAMING ERROR ---------------------------------------------- repl-temp-000.elm

Cannot find variable `Homme`

9| sofiene = Homme
             ^^^^^

> type Genre = Homme | Femme
> sofiene = Homme
Homme : Repl.Genre
>
```

#### Alias de type

Il est possible de créer un alias pour "renommer" ou "nommer" d'autres types simples 
Si par exemple vous avez des positions géographiques qui suivent ce schéma: { lat:Int, long:Int }, il est possible de créer un aliases de type comme suite:

`type alias Location = { lat:Int, long:Int }`

On pourrait donc améliorer la lisibilité du code en passant de cela:

```
parcours : { x:Int, y:Int } -> { x:Int, y:Int } -> { x:Int, y:Int }
parcours a b =
  { a.x + b.x, a.y + b.y }
```

à ca:

```
type alias Position = { x:Int, y:Int }
parcours : Position -> Position -> Position
parcours a b =
  { a.x + b.x, a.y + b.y }`

```

Voici un code qui en cas d'erreur retournerais le message: "The definition of `moderateur` does not match its type annotation. Si jamais nous resneeignons au moderateur l'"emal" au lieu de l'"email".

```
import Html exposing (text)


type alias Utilisateur = { username : String, password: String, email: String, niveau: Int }

moderateur : Utilisateur
moderateur = { username = "Elyes", password= "SuperSecretPassword", email= "elyes@example.com", niveau= 2}
main =
  text (moderateur.username ++ " a le niveau de " ++ toString(moderateur.niveau))
```

Notez qu'en théorie un alias est intéréssant lorsqu'il est utilisé au moins 2 fois, sinon la définition et l'utilisation prendrait plus de ligne de code, pour "rien"

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

Les records sont immutables donc pas question de modifier son contenu directement, il faut créer un nouveau record avec les modifications necessaires via le type union "|":

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

L'ajout et la suppression de champ ont été supprimé dans la version 0.16 (ou 0.6 du compilateur) d'elm puisque le type "union" permet de le faire (le fameux pipe)

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

On peut donc faire :

```
1 :: 2 :: 3 :: 4 :: []
```

#### Map Filter et Foldl / foldr

Ces 3 fonctions sont les équivalentes javascript de map filter et reduce
- map permet en boucle de faire une opération sur chaque élement d'une iste
- filter permet de retourner ou pas un élement d'une liste si la fonction qui lui est appliquée retourne True
- reduce/foldl permet de faire des opérations sur l'ensemble des élements

La différence entre foldl et foldr est le sens par lequel nous commencons, foldl à partir de la gauche (left) et foldr à partir de la droite (right)

Si vous avez simplement besoin de faire une somme ou un produit les fonctions sum et product exist déjà
Toutes les fonctions disponibles pour les listes sont les suivantes:

isEmpty, length, reverse, member, head, tail, filter, take, drop, singleton, repeat, range, (::), append, concat, intersperse, partition, unzip, map, map2, map3, map4, map5, filterMap, concatMap, indexedMap, foldr, foldl, sum, product, maximum, minimum, all, any, scanl, sort, sortBy, sortWith

Voici un exemple d'utiliser de certaines des fonctions ci dessus citées:


```
> maList = [1,3,4,0,5,7,1,6,8,13,9]
[1,3,4,0,5,7,1,6,8,13,9] : List number
> List.map (\n -> n * n) maList
[1,9,16,0,25,49,1,36,64,169,81] : List number
> List.filter(\n -> n % 2 == 0 ) maList
[4,0,6,8] : List Int
> List.foldl (+) 0  maList
57 : number
> List.sum maList
57 : number
> List.maximum maList
Just 13 : Maybe.Maybe number
> List.minimum maList
Just 0 : Maybe.Maybe number
> List.sort maList
[0,1,1,3,4,5,6,7,8,9,13] : List number
>
```

#### Les Tuples

Les records s'ecrivent entre des accolades {}, les listes entre des crochets [] et les tuples entre des parenthèses ()
Les tuples sont une sorte de record sans nom de valeur, en faite il est recommandé d'utiliser les records des qu'un tuple dépasse les 2 valeurs, d'ailleurs les seules fonctions disponibles sont:

first, second, mapFirst, mapSecond

```
> tuple1 = ("mot", 2)
("mot",2) : ( String, number )
> Tuple.first tuple1
"mot" : String
> Tuple.second tuple1
2 : number
> Tuple.mapFirst (\n -> "La premiere valeur est: " ++ n) tuple1("La premiere valeur est: mot",2) : ( String, number )
> Tuple.mapFirst String.reverse tuple1
("tom",2) : ( String, number )
> Tuple.mapSecond (\n -> n * n) tuple1
("mot",4) : ( String, number )
>
```

#### Les commentaires

Les commantaires sont des textes qui seront ignorés par le compilateur, ils sont utilisés pour décrire le code ou la méthodologie utilisée

Il existe des commantaire sur une seule ligne et des commantaires de block sur plusieurs lignes

```
> 1 + 1 -- Ceci est un commantaire sur une seule ligne
2 : number
> 1 + 1 {- Ceci est un commentaire \
| sur plusieurs \
| lignes -}
2 : number
>
```

#### Les fonctions

Les fonctions doivent être le plus simple et court possible
si des élements appartiennet à la fonctions (puisqu'il n'y a pas de caractère délimiteur de block comme en javascript) on utilise l'indentation

```
> function1 a = a + 1
<function> : number -> number
> function1 3
4 : number
> function2 b \
| = b + 1
-- SYNTAX PROBLEM -------------------------------------------- repl-temp-000.elm

The = operator is reserved for defining variables. Maybe you want == instead? Or
maybe you are defining a variable, but there is whitespace before it?

7|   = b + 1
     ^
Maybe <http://elm-lang.org/docs/syntax> can help you figure it out.


> function2 b \
|   = b + 1
<function> : number -> number
> function2 3
4 : number
>
```
##### Fonctions anonymes

Les fonctions anonymes utilise la barre lambda (a ne pas confondre avec la même barre de fin de ligne qui permet de dire au REPL que l'instruction n'est pas fini)

```
> List.map(\n -> n*n) [1,2,3,4,5,6,7,8,9]
[1,4,9,16,25,36,49,64,81] : List number
```

#### Créer un scope locale

Les constantes définis dans un scope local ne sont pas accesible à l'extérieur de ce scope, on utilse les mots clés `let` et `in`
let défini les constantes locales et in défini la zone du scope. Ces deux zones sont identifiées ou délimités par leur niveau d'intentation

```
> b = "exterieur"
"exterieur" : String
> func1 a = let b = "interieur" in a ++ b
<function> : String -> String
> b
"exterieur" : String
> func1 "accees "
"accees interieur" : String
>
```

#### Fonctions pures

L'un des concepts de la programmation fonctionnelle est l'utilisation de fonctions pures, ce sont des fonctions qui n'ont pas d'effet de bord et dont le résultat ne dépend que des arguments, comme le font les fonctions mathématiques.

#### Interet des fonctions pures

Les fonctions pures de par leur nature, peuvent facilement être testé, de plus lors de leur appel, vu qu'elles n'ont aucun effets de bord, elle ne risque pas de casser l'exécution d'autres fonctions, de plus les fonctions pures sont "parralélisable" et être exécuté dans un environnement multithread.

Pour une même valeur d'entrée une fonction pure retournera la même valeur de sortie ce qui permet:
- De mettre en cache le resultat des fonctions pures
- De remplacer lors de la compilation une fonction pure par sa valeur de retour

Lors de la compilation, il est égaleme

Notez que malgré les avantages des fonctions pures, il est cependant impossible de rendre toutes les fonctions pures, par exemple les fonctions relatives aux dates et heures ou aux fonctions hasardeuse (random) res

#### Curryfication

La curryfication permet de rendre une fonction pure, l'opération inverse s'appelle la décurryfication. Le mot curry vient du nom du mathématicien Haskell Curry.

Il est très simple de faire du currying comme suit:

```
> somme a b = a + b
<function> : number -> number -> number
> somme 2
<function> : number -> number
> sommeDeux = somme 2
<function> : number -> number
> sommeDeux 5
7 : number
> sommeDeux 10
12 : number
>
```


#### Condition if

```
> if True == True then "egaux" else "non egaux"
"egaux" : String
>
```

Il est possible d'avoir plusieurs if successif

```
> age = 17
17 : number
> if age > 22 then "plus de 22 ans" else if age > 20 then "entre 20 et 22 ans" else "moins de 2""moins de 22 ans" : String
>
```

Attention! Même chose que pour les fonctions, si l'expression s'écrit par block (en multiligne) alors on utilise les indentations pour les délimiter

#### Matching case

Lorsque nous avons plusieurs if imbriqué il est possible d'utiliser l'expresson case. Elm n'aime pas les cases qui ne test pas toutes les possibilités pour évité d'avoir un cas non résolu. L'équivalent du `default` de javascript est `_`


```
import Html exposing (text)
import String

jours number =
  case number of
    1 -> "Lundi"
    2 -> "Mardi"
    3 -> "Mercredi"
    4 -> "Jeudi"
    5 -> "Vendredi"
    6 -> "Samedi"
    7 -> "Dimanche"
    _ -> "Inconnu"

main =
  text (String.join ", " listeJours)


listeJours =
  [ jours 1
  , jours 2
  , jours 3
  , jours 4
  , jours 5
  , jours 6
  , jours 7
  ]
```

# Création de l'application elm

## L'architecture d'Elm

Elm a trois principaux composants

* Model: Un modèle pour l'état de l'application
* View: Une vue pour l'affchage de l'application en fonction de l'état
* Update: l'update qui gère les modifications de l'etat de l'application en fonction des interaction avec l'utilisateur, d'une api ou d'un serveur


## Première application elm - test

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

### Autres application

L'application de compteur est ce que l'on trouve partout, ca nous permet de voir le fonctionnement du model et de l'update que vous trouverez similaire à redux si jamais vous connaissez:


```
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
update msg model =
  case msg of
    Increment ->
      { valeur = model.valeur + 1 }

    Decrement ->
      { valeur = model.valeur - 1 }

    Reset ->
      { valeur = 0 }
```

Ajoutons un élément au model juste pour test:

```
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
```


#### Retour sur la création du programme

Dans le module HTML qui fonctionne notamment en modifiant un DOM virtuel (VirtualDOM), la fonction beginnerProgram permet de créer votre programme en définissant le model (les données), la vue (l'affichage) et l'update (les actions), mais beginnerProgram se base sur une autre fonction appelé program.
program a comme paramètre:

- init (initialisation des données / du model)
- view (la vue)
- update (les actions qui modifient l'état)
- subscription (la surveillance des changements d'états)

Il existe également la fonction programWithFlags qui permet d'initialiser votre programme hors d'elm via javascript

Notez que tous les élements HTML sont générer via la fonction node (chaque élément du DOM étant un noeud) du module VirtualDOM

#### Requêtes HTTP 

Pour faire des requêtes il faut d'abord avoir l'URL d'un serveur qui vous répondra, choisissons pas exemple Random User: 
En accédant a cette [adresse](https://randomuser.me/api/) vous récupérer des données au format JSON d'un utilisateur au hasard, pour récupérer les données de X utilisateurs il vous suffit de rajouter le paramètres results:
https://randomuser.me/api/?results=X

Concrètement il faut utiliser le modules HTTP (elm-lang/http) pour la gestion des requêtes et éventuellement HTTP.Progress pour suivre l'évolution de la réponse.

Lancons nous dans notre application SPA

# Implémentation

## Les alias de type

En regadant le résultat de `https://randomuser.me/api/?results=6` on peut en déduire les types suivants: 

```
-- Type Alias

type alias Name =
    { title	: String
    , first	: String
    , last	: String
    }
   
type alias Login =
    { username	: String
    , password	: String
    , salt	: String
    , md5	: String
    , sha1	: String
    }
    
type alias Id =
    { name	: String
    , value	: String
    }
    
type alias Location =
    { street	: String
    , city	: String
    , state	: String
    , postcode : Int
    }
    
type alias Picture =
    { large	: String
    , medium	: String
    , thumbnail	: String
    }
    
type alias User =
    { gender	: String
    , name	: Name
    , location	: Location
    , email : String
    , login	: Login
    , dob	: String
    , register : String
    , phone	: String
    , cell	: String
    , id : Id
    , picture : Picture
    , cell : String
    }

type alias Info = 
    { seed  : String
    , results  : Int
    , page  : Int
    , version : String
    }

type alias Model =
    { query : String
    , results : List User
    , info : Info
    , error : Maybe String
    }
```



