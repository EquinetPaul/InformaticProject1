(*
 ------------------------------------------------------------------------------------
 -- Fichier           : main.pas
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 10 10:52:49 2018
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Compilation       : fpc
 -- Edition des liens : fpc
 -- Execution         : shell
 ------------------------------------------------------------------------------------
 *)
PROGRAM Main;
{$mode objfpc}{$H+}
{$codepage UTF8}
{$I-}
(* Déclaration des librairies utilisées *)

USES cwstring, sysutils, crt, fct, cmd;
(* Déclaration des variables utilisées dans le programme principal *)
VAR
   i : Integer; commande : String;
   (*Début du programme principal*)
BEGIN
	commande := '';
	Randomize;
   i := 1;
   FOR i:=1 TO ParamCount DO BEGIN
      commande := commande + ParamStr(i);
   END;
   traiterCommande(commande);
END.

(*Fin du programme principal*)
