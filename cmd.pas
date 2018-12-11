UNIT cmd;

INTERFACE

(* Déclaration des fonctions utilisables par le programme principal *)
PROCEDURE afficherCommandes();
PROCEDURE traiterCommande(commande : Char; val : Integer);

IMPLEMENTATION

USES user;

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : afficherCommandes
 -- Auteur            :
 -- Date de creation  : Tue Dec 11 14:35:05 2018
 --
 -- But               : afficher les commande disponibles
 -- Remarques         : fichier cmd.txt nécessaire
 -- Pré conditions    : aucune
 -- Post conditions   : affiche dans le shell les commandes lues dans le fichier
 ------------------------------------------------------------------------------------*)
PROCEDURE afficherCommandes();
VAR
   ligne : String; fic   : Text;
BEGIN
   ligne := '';
   { $i- }
   assign(fic, 'cmd.txt');
   RESET(fic);
   WHILE NOT(eof(fic)) DO BEGIN
      READLN(fic, ligne);
      WRITELN(ligne);
   END;
   close(fic);
END; { afficherCommandes }

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : traiterCommande()
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Tue Dec 11 15:26:45 2018
 --
 -- But               : traiter les commandes mises en paramètres lors du lancement du programme
 -- Remarques         : Aucune
 -- Pré conditions    : aucune
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
PROCEDURE traiterCommande(commande : Char ; val : Integer);
BEGIN
   CASE commande OF
     'a' : creeMotAleatoireUtilisateur(val);
     ELSE
        afficherCommandes();
   END;
END;


END.
