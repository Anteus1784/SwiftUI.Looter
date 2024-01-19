# Looter

## 2 - AppBasics

### Exercice 1

- Pour SwiftUI, la liste de string que je lui envoie contient que des element identique, il faut donc les rendre unique avec un identifiant.

### Exercice 2

- Une fonction d'ajout a été ajouté, ainsi qu'un bouton dans la liste, puisque l'action declenché par le bouton concerne les elements de la liste.

- Le Foreach permet de prendre en compte les element ajouté a loot avec le bouton. Si le bouton est rajouter dans le foreach il sera dupliqué pour chaque item.

### Exercice 3

- Non, la fonction .append effectue un changement dans une liste contenu dans un struct, qui est un element non mutable.

- L'ajout de @State a la variable loot permet de sauvegarder son etat et la transmettre, ainsi lors d'une destruction-reconstruction l'état est conservé et appliqué.

## 3 - Sheets

### Exercice 1 

- Voir code de AddItemView

## 4 - Ajout-Item

### Exercice 1

- Le bouton ajouter permet l'ajout d'un item dans une liste contenu dans une classe. Par consequent, l'état n'est pas sauvegardé lors de la destruction-recostruction.

### Exercice 2

- La variable loot est publié et donc sauvegardé lors de la destuction-reconstruction

- @StateObject permet d'initialiser l'objet observable en tant que propriété comme @ObservedObject, mais il permet de l'inbstancier une et unique fois, et ainsi eviter les doublon.



