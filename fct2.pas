UNIT fct2;
INTERFACE

{$mode objfpc}{$H+}
{$codepage UTF8}
{$I-}
USES cwstring, sysutils, crt, fct;
(* Déclaration des fonctions utilisables par le programme principal *)
FUNCTION creeMotAleatoire(taille : Integer):WideString ;
function creeMotDigramme(taille : Integer;tableauxDigramme:tbx):WideString;

IMPLEMENTATION

(* Déclaration des constantes utilisées *)
CONST
   alphabet: WideString =  'abcdefghijklmnopqrstuvwxyzàâéèêëîïôùûüÿæœç-';

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : creeMotAleatoire
 -- Auteur            :
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
      res := res + alphabet[Random(length(alphabet)+1)];
   END;
   creeMotAleatoire:= res;
END;

function lettreSuivante(t: tab):WideString;
var 
	res : widestring;
	choix : real; 
	i : integer;
	interval : tab;
begin
	choix := random(round(sommeTableau(t)))+1; interval[low(t)] := 0;	res := alphabet[1];
	for i := low(t) to high(t) do begin
		if i <> low(t) then begin
			interval[i] := interval[i-1] + t[i];
		end
		else begin
			interval[i] := interval[i] + t[i];
		end;
	end;
	for i := low(t) to high(t) do begin
		if (choix >= interval[i]) and (choix <= interval[i+1]) then begin
				res := alphabet[i+1];
		end;
	end;	
	lettreSuivante := res;
end;

function creeMotDigramme(taille : Integer;tableauxDigramme:tbx):WideString;
VAR
	res: WideString; i : integer;
BEGIN
	res := '';
	for i := 1 to taille do begin
		if i = 1 then
			res := res + lettreSuivante(tableauxDigramme.frequenceLettreDebut)
		else if (i+1) = taille then
			res := res + lettreSuivante(tableauxDigramme.frequenceLettreFin)
		else
			res := res + lettreSuivante((tableauxDigramme.digramme)[indiceLettre(res[length(res)])]);
	end;
	creeMotDigramme := res;
END;



END.
