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
(* Déclaration des librairies utilisées *)
USES cwstring, sysutils, fct, cmd;
{$mode objfpc}{$H+}
{$codepage UTF8}
{$I-}

(* Déclaration des variables utilisées dans le programme principal *)
VAR
   i, val : Integer; commande : Char;

(*Début du programme principal*)
BEGIN
   i := 1;
   WHILE i <= 2 DO BEGIN
      commande := ParamStr(1)[2];
      val := StrToInt(ParamStr(2));
      i := i + 1;
   END;
   traiterCommande(commande, val);
END.
(*Fin du programme principal*)
