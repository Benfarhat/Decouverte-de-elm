Programmer en ELM

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

