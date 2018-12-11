UNIT user;
INTERFACE

(* Déclaration des fonctions utilisables par le programme principal *)
PROCEDURE creeMotAleatoireUtilisateur(val : Integer);

IMPLEMENTATION

(* Déclaration des constantes utilisées *)
USES fct2;

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : creeMotAleatoireUtilisateur()
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Tue Dec 11 14:51:33 2018
 --
 -- But               : demander à l'utilisateur un entier et appelle la fonction creemotaleatoire()
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
PROCEDURE creeMotAleatoireUtilisateur(val :Integer);
VAR
   longueurMotUtilisateur :Integer; appelleFonction : String;
BEGIN
   longueurMotUtilisateur := val;
   appelleFonction := creeMotAleatoire(longueurMotUtilisateur);
   WRITELN(appelleFonction);
END;

END.
