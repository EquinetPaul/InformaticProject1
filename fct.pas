UNIT fct;
INTERFACE
{$mode objfpc}{$H+}
{$codepage UTF8}
{$I-}
(* Déclaration des librairies utilisées *)
USES Crt;

CONST
	nombreLettreAlphabet = 43;
	alphabet: WideString   = 'abcdefghijklmnopqrstuvwxyzàâéèêëîïôùûüÿæœç-';
TYPE
	tab  = ARRAY[1..nombreLettreAlphabet] OF Extended;
	tab2 =  ARRAY[1..nombreLettreAlphabet] OF tab;
	commandeType = ARRAY [1..6] of String;
	tbx = record
   	frequenceLettre, frequenceLettreDebut, frequenceLettreFin : tab;
   	frequenceSuccession, digramme : tab2;
   end;


(* Déclaration des fonctions utilisables par le programme principal *)
PROCEDURE clear();
procedure passe();
procedure aft(t:tab);
procedure aft2(a:tab2);
function sommeAllTableau(t:tab2):real;
function sommeTableau(t:tab):real;
FUNCTION indiceLettre(lettre : WideString):Integer ;
function arrayToStr(commande:commandeType):String;
function motValide(mot:widestring):Boolean;

IMPLEMENTATION

function motValide(mot:widestring):Boolean;
var
	res : boolean;
	i, j : integer;
begin
	res := True;
	for i := 1 to length(mot) do begin
		j := 0;
		repeat
			j := j + 1;
			writeln(j);
		until (mot[i] = alphabet[j]) OR (j>length(alphabet)) ;
		if j>nombreLettreAlphabet then begin
			res := false;
		end;
	end;
	motValide := res;			
end;

function arrayToStr(commande:commandeType):String;
var
	res : string;
	i : integer;
begin
	res := '';
	for i := low(commande) to high(commande) do begin
		res := res + commande[i];
	end;
	arrayToStr := res;	
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : indiceLettre
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 09:03:50 2018
 --
 -- But               : trouver l'indice d'une lettre voulu dans le tableau alphabet
 -- Remarques         : Aucune
 -- Pré conditions    : une lettre de TYPE caractére
 -- Post conditions   : un entier: l'indice de la lettre dans le tableau alphabet
 ------------------------------------------------------------------------------------*)
FUNCTION indiceLettre(lettre : WideString):Integer ;
VAR indice : Integer;
BEGIN
   indice := 1;
   WHILE lettre <> alphabet[indice] DO
      indice := indice + 1;
   indiceLettre := indice;
END; { indiceLettre }

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : sommeTableau
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 09:03:50 2018
 --
 -- But               : faire la somme de toutes les valeurs d'un tableau
 -- Remarques         : Aucune
 -- Pré conditions    : un tableau d'une dimension de type real ou integer
 -- Post conditions   : un real : la somme des toutes les valeurs du tableau d'entré
 ------------------------------------------------------------------------------------*)
function sommeTableau(t:tab):real;
var i: integer; res : real;
begin
	res := 0;
	for i := low(t) to high(t) do begin
		res := res + t[i];
	end;
	sommeTableau := res;
end;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : sommeTableau
 -- Auteur            : toto noName <toto.noName@eisti.eu>
 -- Date de creation  : Mon Dec 17 09:03:50 2018
 --
 -- But               : faire la somme de toutes les valeurs d'un tableau à deux dimensions
 -- Remarques         : Aucune
 -- Pré conditions    : un tableau de deux dimension de tableaux de real ou integer
 -- Post conditions   : un real : la somme des toutes les valeurs du tableau d'entré
 ------------------------------------------------------------------------------------*)
function sommeAllTableau(t:tab2):real;
var i: integer; res : real;
begin
	res := 0;
	for i := low(t) to high(t) do begin
		res := res + sommeTableau(t[i]);
	end;
	sommeAllTableau := res;
end;


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

procedure passe;	
begin
end;

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : aft2
 -- Auteur            : ---
 -- Date de creation  : Mon Dec 10 11:14:23 2018
 --
 -- But               : afficher les valeurs d'un tableau à deux dimensions
 -- Remarques         : Aucune
 -- Pré conditions    : un tableau à deux dimensions
 -- Post conditions   : 
 ------------------------------------------------------------------------------------*)
PROCEDURE aft2(a :tab2) ;
VAR
   i,j: Integer;
BEGIN
   FOR i:=1 TO length(a) DO BEGIN
      FOR j:=1 TO length(a) DO BEGIN
		write(a[i,j]);
      END;
	writeln();
   END;
END;

(*
 ------------------------------------------------------------------------------------
 -- PROCEDURE         : clear
 -- Auteur            : ---
 -- Date de creation  : Mon Dec 10 11:14:23 2018
 --
 -- But               : afficher les valeurs d'un tableau à une dimension
 -- Remarques         : Aucune
 -- Pré conditions    : un tableau à une dimension
 -- Post conditions   : 
 ------------------------------------------------------------------------------------*)
PROCEDURE aft(t : tab) ;
VAR
   i : Integer;
BEGIN
   FOR i:=low(t) TO high(t) DO BEGIN
      WRITELN(i,'-',t[i]);
   END;
END;

END.
