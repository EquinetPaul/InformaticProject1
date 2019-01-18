# InformaticProject1
NAME
	projet - la machine à inventer des mots
SYNOPSIS
	projet [OPTION]... FILE
DESCRIPTION
Génère des mots ou des phrases à partir du dictionnaire FILE
	-a utilise la méthode aléatoire pour générer les mots
	-d utilise la méthode des digrammes pour générer les mots
	-t utilise la méthode des trigrammes pour générer les mots
	-p génère une phrase (en utilisant la méthode des ,→ trigrammes)
	-n génère NB mots (par défaut génère 10 mots)
	-s affiche uniquement des mots de NB caractères (par défaut longueur 5 à 10 caratères sans appel de cette commande
	-h affiche cette aide et quitte	
AUTHORS
Écrit par P. Equinet, G. Sordel.

<--- ON LINUX --->
  - Compiler main.pas (fpc main.pas)
  - Lancer ./main [OPTION]... FILE
