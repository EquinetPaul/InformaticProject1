UNIT user;
INTERFACE
USES fct, fct2, Crt, digramme, phrases;

(* Déclaration des fonctions utilisables par le programme principal *)
PROCEDURE creeMotAleatoireUtilisateur(val : Integer);
procedure repeterFonction(fct:String; nombre:Integer; taille : Integer; fileName: String);

IMPLEMENTATION
USES cmd;
(* Déclaration des constantes utilisées *)

CONST
	nombreLettreAlphabet = 43;

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
BEGIN
   WRITELN(creeMotAleatoire(val));
END;

procedure creeMotDigrammeUtilisateur(val: Integer; tableauxDigramme :tbx);
begin
	writeln(creeMotDigramme(val,tableauxDigramme));
end;

procedure creePhraseUtilisateur;
begin
	writeln(genererUnePhrase());
end;

procedure repeterFonction(fct:String; nombre:Integer; taille : Integer; fileName: String);
var
	i, tailleGeneree : integer;
	tableauxDigramme : tbx;
begin
	clear();
	if fct = 'd' then begin 
		tableauxDigramme := creerDigrammeUtilisateur(fileName);
	end;
	for i:= 1 to nombre do begin
		tailleGeneree := taille;
		if taille = 0 then begin
			tailleGeneree := Random(6)+5; {Random(6) génère un nombre entre [1;5[, on y ajoute 5 pour avoir l'intervalle [5:10]}
		end;
		case fct of
			'a' : creeMotAleatoireUtilisateur(tailleGeneree);
			'd' : creeMotDigrammeUtilisateur(tailleGeneree, tableauxDigramme);
			'p' : creePhraseUtilisateur();
		ELSE
			afficherCommandes();
		end;
	end;
		
end;	

END.
