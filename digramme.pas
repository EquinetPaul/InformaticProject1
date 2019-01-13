UNIT digramme;
INTERFACE
{$mode objfpc}{$H+}
{$codepage UTF8}
{$I-}
USES cwstring, sysutils, fct;

function creerDigrammeUtilisateur():tbx;

IMPLEMENTATION
CONST
   alphabet: WideString   = 'abcdefghijklmnopqrstuvwxyzàâéèêëîïôùûüÿæœç-';
   nombreLettreAlphabet = 43;

function choisirPremiereLettre(t : tab):String;
var 
	indice : integer;
	res : String;
begin
	repeat
		indice := random(length(alphabet)+1);
		res := alphabet[indice];
	until t[indiceLettre(res)] >= 100;
	choisirPremiereLettre := res;
end;

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : compterFrequenceLettre
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 09:19:32 2018
 --
 -- But               : ajoute à un tableau d'indice n lettres de chaines de caractère de l'alphabet le nombre de fois qu'un caractère apparait
 -- Remarques         : Aucune
 -- Pré conditions    : un mot de TYPE widestring
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
function compterFrequenceLettre(mot : WideString; t: tab):tab ;
VAR 
	indice : Integer;
	res : tab;
BEGIN
	res := t;
   FOR indice := 1 TO length(mot) DO BEGIN
      res[indiceLettre(mot[indice])] := res[indiceLettre(mot[indice])] + 1;
   END;
	compterFrequenceLettre := res;
END; { compterFrequenceLettre }

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : compterFrequenceLettreDebut
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 09:19:32 2018
 --
 -- But               : compte le nombre de fois qu'une lettre est présente en début d'un mot et comptabilise le tout dans un tableau
 -- Remarques         : Aucune
 -- Pré conditions    : un mot de TYPE widestring
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
function compterFrequenceLettreDebut(mot : WideString; t: tab):tab;
var
	res : tab;
BEGIN
	res := t;
   res[indiceLettre(mot[1])] := res[indiceLettre(mot[1])] + 1;
	compterFrequenceLettreDebut := res;
END; { compterFrequenceLettre }

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : compterFrequenceLettreFin
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 09:19:32 2018
 --
 -- But               : compte le nombre de fois qu'une lettre est présente en fin d'un mot et comptabilise le tout dans un tableau
 -- Remarques         : Aucune
 -- Pré conditions    : un mot de TYPE widestring
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
function compterFrequenceLettreFin(mot : WideString; t: tab):tab ;
var
	res : tab;
BEGIN
	res := t;
   res[indiceLettre(mot[length(mot)])] := res[indiceLettre(mot[length(mot)])] + 1;
   compterFrequenceLettreFin := res;
END; { compterFrequenceLettre }

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : compterFrequenceSuccessionLettre()
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 10:14:01 2018
 --
 -- But               : affecter à chaque valeur du digramme les fréquences d'apparitions de chaque lettre par rapport à une précédente
 -- Remarques         : Aucune
 -- Pré conditions    : un mot
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
function compterFrequenceSuccessionLettre(mot : wideString;t : tab2):tab2;
VAR
   i: Integer; res: tab2;
BEGIN
	res := t;
	for i := 1 to length(mot)-1 do begin
		res[indiceLettre(mot[i]), indiceLettre(mot[i+1])] := res[indiceLettre(mot[i]), indiceLettre(mot[i+1])] + 1;
	end;
	compterFrequenceSuccessionLettre := res;
END; { compterFrequenceSuccessionLettre }


function creerDigramme(tableauFrequenceSuccession: tab2;tableauFrequenceLettre : tab; tableauFrequenceFin:tab): tab2;
var
	res : tab2;
	i, j : integer;
begin
	for i := 1 to nombreLettreAlphabet do begin
		for j := 1 to nombreLettreAlphabet do begin
			if (tableauFrequenceLettre[i]-tableauFrequenceFin[i] > 0)  then begin
				res[i,j] := round(100*tableauFrequenceSuccession[i,j] / (tableauFrequenceLettre[i]-tableauFrequenceFin[i]));
			end;
		end;
	end;
	creerDigramme := res;
end;

function calculsTableau(mot: Widestring; t : tbx):tbx;
begin
	t.frequenceLettre := compterFrequenceLettre(mot, t.frequenceLettre);
	t.frequenceLettreDebut := compterFrequenceLettreDebut(mot, t.frequenceLettreDebut);
	t.frequenceLettreFin := compterFrequenceLettreFin(mot, t.frequenceLettreFin);
	t.frequenceSuccession := compterFrequenceSuccessionLettre(mot, t.frequenceSuccession);
	calculsTableau := t;
end;

function motValide(mot:widestring):Boolean;
var
	res : boolean;
	i, j : integer;
begin
	res := false;
	for i := 1 to length(mot) do begin
		for j := 1 to length(alphabet) do begin
			if mot[i] = alphabet[j] then begin
				res := true;
			end;
		end;
	end;
	motValide := res;			
end;
	

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : lireLexique
 -- Auteur            :
 -- Date de creation  : Tue Dec 11 14:35:05 2018
 --
 -- But               : lire le lexique ligne par ligne et executer chaque fonctions sur chaque lignes
 -- Remarques         : fichier(s) nécessaire(s)
 -- Pré conditions    : nom du fichier
 -- Post conditions   :
 ------------------------------------------------------------------------------------*)

function lireLexique(nomFichier : String; t : tbx):tbx;
VAR
   ligne :wideString; fic   : Text; res : tbx;
BEGIN
   ligne := '';
   assign(fic, nomFichier);
   RESET(fic);
   WHILE NOT(eof(fic)) DO BEGIN
	READLN(fic, ligne);
	ligne := LowerCase(ligne);
	if motValide(ligne) then begin 
		res := calculsTableau(ligne, res);
	end;	
   END;
   close(fic);
   lireLexique := res;
END;

function creerTableauFrequencePremiereLettre(frequencePremiereLettre:tab):tab;
var
	res : tab;
	i : integer;
	somme : real;
begin
	somme := sommeTableau(frequencePremiereLettre);
	for i := low(res) to high(res) do begin
		if frequencePremiereLettre[i] > 0 then begin
			res[i] := round(100*(frequencePremiereLettre[i] / somme));
		end
		else begin
			res[i] := 0;
		end;
			
	end;
	creerTableauFrequencePremiereLettre := res;
end;

function creerTableauFrequenceDerniereLettre(frequenceDerniereLettre:tab):tab;
var
	res : tab;
	i : integer;
	somme : real;
begin
	somme := sommeTableau(frequenceDerniereLettre);
	for i := low(res) to high(res) do begin
		if frequenceDerniereLettre[i] > 0 then begin
			res[i] := round(100*(frequenceDerniereLettre[i] / somme));
		end
		else begin
			res[i] := 0;
		end;
			
	end;
	creerTableauFrequenceDerniereLettre := res;
end;


function creerDigrammeUtilisateur():tbx;
VAR
	tableaux, res : tbx;
begin
	tableaux := lireLexique('lexique2.txt', tableaux);
	res.frequenceLettreDebut := creerTableauFrequencePremiereLettre(tableaux.frequenceLettreDebut);
	res.frequenceLettreFin := creerTableauFrequenceDerniereLettre(tableaux.frequenceLettreDebut);
	res.digramme := creerDigramme(tableaux.frequenceSuccession , tableaux.frequenceLettre, tableaux.frequenceLettreFin); 
	creerDigrammeUtilisateur := res;
end;


BEGIN
END.
