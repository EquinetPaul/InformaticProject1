unit cmd;

interface
{$mode objfpc}

procedure traiterCommande(commande: String);
procedure afficherCommandes();

implementation
uses sysutils, fct, user;

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

procedure commandeSimple(commande:String);
var
	commande1 : String;
begin
commande1 := copy(commande, pos('-', commande)+1, pos('-', commande)+1);
case commande1 of
	'a', 'd', 'p' : repeterFonction(commande1, 10, 0);
	ELSE
		afficherCommandes();
	end;
end;

procedure commandeDouble(commande:String);
var
	commande1, commande2 : String;
	valeurCommande2 : Integer;
begin
commande1 := copy(commande, pos('-', commande)+1, pos('-', commande));
commande2 := copy(commande, pos(commande1, commande)+2, pos('-', commande));
try
	valeurCommande2:= StrToInt(copy(commande, pos(commande2, commande)+1, length(commande)));
except
  on E: EConvertError do
	valeurCommande2 := 10;
end;

case commande2 of
	'n' : repeterFonction(commande1, valeurCommande2, 0);
	's' : repeterFonction(commande1, 10, valeurCommande2);
	ELSE
		afficherCommandes();
	end;
end;

procedure commandeTriple(commande:String);
var
	commande1, commande2, commande3, suiteCommande: String;
	valeurCommande2, valeurCommande3 : Integer;
begin
commande1 := copy(commande, pos('-', commande)+1, pos('-', commande));
commande2 := copy(commande, pos(commande1, commande)+2, pos('-', commande));
suiteCommande := copy(copy(commande, pos(commande2, commande), length(commande)), pos(commande2, copy(commande, pos(commande2, commande), length(commande)))+1, pos('-', copy(commande, pos(commande2, commande), length(commande)))-2 );

try
	valeurCommande2 := StrToInt(suiteCommande);
	commande3 := copy(copy(commande, pos(suiteCommande, commande), length(commande)), pos('-', copy(commande, pos(suiteCommande, commande), length(commande)))+1, 1);
	valeurCommande3 := StrToInt(copy(commande, pos(commande3, commande)+1, 10));
except
  on E: EConvertError do
	valeurCommande2 := 10;
  on E: EConvertError do
	valeurCommande3 := 10;

end;

case commande2 of
	'n' : repeterFonction(commande1, valeurCommande2, valeurCommande3);
	's' : repeterFonction(commande1, valeurCommande3, valeurCommande2);
	ELSE
		afficherCommandes();
	end;
		
end;

procedure traiterCommande(commande: String);
var 
	nombreCommande : Integer;
begin
nombreCommande := countVal(commande, '-');
case nombreCommande of 
	1 : commandeSimple(commande);
	2 : commandeDouble(commande);
	3 : commandeTriple(commande);
	ELSE
        	afficherCommandes();
	end;
end;

end.
