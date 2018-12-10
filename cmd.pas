UNIT cmd;
INTERFACE
(* Déclaration des librairies utilisées *)

(* Déclaration des fonctions utilisables par le programme principal *)
PROCEDURE afficherCommandes;

IMPLEMENTATION
(* Déclaration des constantes utilisées *)

PROCEDURE afficherCommandes;
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

END.
