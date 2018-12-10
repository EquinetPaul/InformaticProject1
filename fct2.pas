UNIT fct2;
INTERFACE
(* Déclaration des librairies utilisées *)

(* Déclaration des fonctions utilisables par le programme principal *)
FUNCTION creeMotAleatoire(taille : Integer):WideString ;

IMPLEMENTATION
(*
 ------------------------------------------------------------------------------------
 -- Fonction          : creeMotAleatoire
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 10 11:32:45 2018
 --
 -- But               : Générer un mot aléatoire de taille donéee
 -- Remarques         : Aucune
 -- Pré conditions    : Un entier (taille du mot à générer)
 -- Post conditions   : Générer un mot aléatoire de taille donnée
 ------------------------------------------------------------------------------------*)
FUNCTION creeMotAleatoire(taille : Integer):WideString ;
VAR
   res : WideString; i : Integer;
BEGIN
   res := '';
   FOR i:= 1 TO taille DO BEGIN
      res := res + alphabet[Random(length(alphabet))];
   END;
   creeMotAleatoire:= res;
END;

END.
