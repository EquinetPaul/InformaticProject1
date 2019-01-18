unit cmd;

interface
{$mode objfpc}
uses sysutils, fct, user;
procedure traiterCommande(commande: commandeType);
procedure afficherCommandes();

implementation


FUNCTION countVal(chaine:String; valeur:char):Integer;
var
	i, res: integer;
begin
	res := 0;
	for i:= 1 to length(chaine) do begin
		if chaine[i] = valeur then begin
			res := res + 1;
		end;
	end;
	countVal := res;
end;

PROCEDURE afficherCommandes();
VAR
   ligne : String; fic   : Text;
BEGIN
   ligne := '';
   assign(fic, 'cmd.txt');
   RESET(fic);
   WHILE NOT(eof(fic)) DO BEGIN
      READLN(fic, ligne);
      WRITELN(ligne);
   END;
   close(fic);
END;

procedure commandeSimple(commande:commandeType);
var
	commande1, fileName : String;
begin
commande1 := copy(commande[1], pos('-', commande[1])+1, 1);
if commande[2] <> '' then begin
	fileName := commande[2];
end else begin
	fileName := 'dico/lexique2.txt';
end;
case commande1 of
	'a', 'd', 'p' : repeterFonction(commande1, 10, 0, fileName);
	ELSE
		afficherCommandes();
	end;
end;

procedure commandeDouble(commande:commandeType);
var
	commande1, commande2, fileName : String;
	valeurCommande2 : Integer;
begin
commande1 := copy(commande[1], pos('-', commande[1])+1, 1);
commande2 := copy(commande[2], pos('-', commande[2])+1, 1);
try
	valeurCommande2 := StrToInt(commande[3]);
except on E: EConvertError do
	valeurCommande2 := 10;
end;
if commande[4] <> '' then begin
	fileName := commande[4];
end else begin
	fileName := 'dico/lexique2.txt';
end;

case commande2 of
	'n' : repeterFonction(commande1, valeurCommande2, 0, fileName);
	's' : repeterFonction(commande1, 10, valeurCommande2, fileName);
	ELSE
		afficherCommandes();
	end;
end;

procedure commandeTriple(commande:commandeType);
var
	commande1, commande2, commande3, fileName: String;
	valeurCommande2, valeurCommande3 : Integer;
begin
commande1 := copy(commande[1], pos('-', commande[1])+1, 1);
commande2 := copy(commande[2], pos('-', commande[2])+1, 1);
commande3 := copy(commande[4], pos('-', commande[4])+1, 1);
try
	valeurCommande2 := StrToInt(commande[3]);
except on E: EConvertError do
	valeurCommande2 := 10;
end;
try
	valeurCommande3 := StrToInt(commande[5]);
except on E: EConvertError do
	valeurCommande3 := 5;
end;
if commande[6] <> '' then begin
	fileName := commande[6];
end else begin
	fileName := 'dico/lexique2.txt';
end;

case commande2 of
	'n' : repeterFonction(commande1, valeurCommande2, valeurCommande3, fileName);
	's' : repeterFonction(commande1, valeurCommande3, valeurCommande2, fileName);
	ELSE
		afficherCommandes();
	end;
end;

procedure traiterCommande(commande: commandeType);
var 
	nombreCommande : Integer;
begin

nombreCommande := countVal(arrayToStr(commande), '-');
case nombreCommande of 
	1 : commandeSimple(commande);
	2 : commandeDouble(commande);
	3 : commandeTriple(commande);
	ELSE
        	afficherCommandes();
	end;
end;

end.
