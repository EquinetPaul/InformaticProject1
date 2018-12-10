UNIT fct;
INTERFACE
(* Déclaration des librairies utilisées *)
USES Crt;

(* Déclaration des fonctions utilisables par le programme principal *)
PROCEDURE clear();

IMPLEMENTATION

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : clear
 -- Auteur            : ---
 -- Date de creation  : Mon Dec 10 11:14:23 2018
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : librairie Crt
 -- Post conditions   : nettoie le shell
 ------------------------------------------------------------------------------------*)
PROCEDURE clear;
BEGIN
   ClrScr();
END;
END.
