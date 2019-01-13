(*
 ------------------------------------------------------------------------------------
 -- Fichier           : phrases.pas
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Dec 17 11:08:26 2018
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Compilation       : fpc
 -- Edition des liens : fpc
 -- Execution         : shell
 ------------------------------------------------------------------------------------
 *)
unit phrases;
{$mode objfpc}{$H+}
{$codepage UTF8}
{$I-}

interface

FUNCTION genererUnePhrase():WideString ;

implementation

USES cwstring,crt;
(*
 ------------------------------------------------------------------------------------
 -- Fonction          : CompterLigneFichier
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Dec 17 11:31:28 2018
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION CompterLigneFichier(nomFichier :WideString):word ;
VAR
   ligne : WideString; fic   : Text; res: word;
BEGIN
   ligne := '';
   res := 0;
   { $i- }
   assign(fic, nomFichier);
   RESET(fic);
   WHILE NOT(eof(fic)) DO BEGIN
      READLN(fic, ligne);
      res := res + 1;
   END;
   close(fic);
   CompterLigneFichier := res;
END; { Compter les lignes d'un fichier en fonction de son nom }

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : Lislaligne(
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Dec 17 11:37:17 2018
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION Lislaligne(nomFichier :WideString ; nbr:Integer):WideString ;
VAR
   fic      : Text;
   nbrligne : Integer;
   ligne    : WideString;
BEGIN
   ligne := '';
   nbrligne:=0;
   { $i- }
   assign(fic,nomFichier);
   RESET(fic);
   WHILE  nbrligne <> nbr DO BEGIN
      READLN(fic,ligne);
      nbrligne := nbrligne + 1;
   END;
   close(fic);
   Lislaligne:= ligne;
END; { Lislaligne }

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : RandomMot
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Dec 17 11:26:38 2018
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION RandomMot(nomFichier :WideString):WideString;
VAR
   nb     : Integer;
   aleanb : Integer;
BEGIN
   nb:= CompterLigneFichier(nomFichier);
   aleanb:= Random(nb)+1;
   RandomMot:= Lislaligne(nomFichier , aleanb);
END; { RandomMot }
(*
 ------------------------------------------------------------------------------------
 -- Fonction          : AccordArticleNomCommun
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Jan  7 15:05:11 2019
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION AccordArticleNomCommun(article,nomCommun :WideString):WideString;
VAR
   res : WideString;
BEGIN
   res := nomCommun;
   IF (article[length(article)]='s') OR (article[length(article)]='x') THEN
   BEGIN
      IF nomCommun[length(nomCommun)]<>'s'THEN
      BEGIN
         res := nomCommun+'s';
      END;
   END;
   AccordArticleNomCommun:= res;
END;{ AccordArticleNomCommun }

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : AccordNomCommunAdjectifs
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Jan  7 15:52:21 2019
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION AccordArticleAdjectifNomCommun(article,adjectif:WideString):WideString ;
VAR
   res : WideString;
BEGIN
   res := adjectif;
   IF ((article[length(article)]='s') OR (article[length(article)]='x')) AND (adjectif[length(adjectif)]<>'s') AND (adjectif[length(adjectif)]<>'x') THEN
   BEGIN
      res := adjectif+'s';
   END;
   AccordArticleAdjectifNomCommun := res;
END; { AccordArticleAdjectifNomCommun }

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : AccordVerbes
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Mon Jan  7 16:04:21 2019
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION AccordVerbesNomCommun(article,verbe : WideString):WideString ;
VAR
   res : WideString;
BEGIN
   res := verbe;
   IF ((article[length(article)]='s') OR (article[length(article)]='x')) AND (verbe[length(verbe)-1]='e') THEN
   BEGIN
      res := copy(res,1,length(res)-1);
      res := res+'nt';
   END
   ELSE IF ((article[length(article)]='s') OR (article[length(article)]='x')) AND (verbe[length(verbe)-1]='i')THEN
   BEGIN
      res := copy(res,1,length(res)-1);
      res := res+'ssent';
   END
   ELSE IF (article[length(article)]<>'s') AND (article[length(article)]<>'x') AND (verbe[length(verbe)-1]='e')THEN
   BEGIN
      res := copy(res,1,length(res)-1);
   END
   ELSE IF (article[length(article)]<>'s') AND (article[length(article)]<>'x') AND (verbe[length(verbe)-1]='i')THEN
   BEGIN
      res := copy(res,1,length(res)-1);
      res := res+'t';
   END;
   AccordVerbesNomCommun:= res;
END; { AccordVerbesNomCommun }

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : AccordVerbesNomPropre
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Thu Jan 10 14:21:23 2019
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION AccordVerbesNomPropre(verbe : WideString):WideString;
VAR
   res : WideString;
BEGIN
   res := verbe;
   IF (verbe[length(verbe)-1]='e') THEN
   BEGIN
      res := copy(verbe,1,length(verbe)-1);
   END
   ELSE IF (verbe[length(verbe)-1]='i') THEN
   BEGIN
      res := copy(verbe,1,length(verbe)-1);
      res := res+'t';
   END;
   AccordVerbesNomPropre:= res;
END;

(*
 ------------------------------------------------------------------------------------
 -- Fonction          : GenererUnePhrase
 -- Auteur            : Sordel Gabin <sordelgabi@eisti.eu>
 -- Date de creation  : Sat Jan 12 09:36:53 2019
 --
 -- But               : But
 -- Remarques         : Aucune
 -- Pré conditions    : Préconditions
 -- Post conditions   : But
 ------------------------------------------------------------------------------------*)
FUNCTION genererUnePhrase():WideString ;
VAR
   article, nomCommun, nomPropre, adjectif, adverbe, verbe, res :  WideString;
	nbr : integer;
BEGIN
	nbr := Random(2);	
   adverbe := RandomMot('phrases/adverbe.txt');
   IF nbr =0 THEN
   BEGIN
      article := RandomMot('phrases/article.txt');
      nomCommun := AccordArticleNomCommun(article,RandomMot('phrases/nomCommun.txt'));
      verbe := AccordVerbesNomCommun(article,RandomMot('phrases/verbePremierEtDeuxiemeGroupe.txt'));
      adjectif := AccordArticleAdjectifNomCommun(article,RandomMot('phrases/adjectif.txt'));
      res:=(article+' '+nomCommun+' '+adjectif+' '+verbe+' '+adverbe);
   END
   ELSE
   BEGIN
      nomPropre := RandomMot('phrases/nomPropre.txt');
      verbe := AccordVerbesNomPropre(RandomMot('phrases/verbePremierEtDeuxiemeGroupe.txt'));
      adjectif := RandomMot('phrases/adjectif.txt');
      res:=(nomPropre+' '+adjectif+' '+verbe+' '+adverbe);
   END;
   genererUnePhrase:= res;
END;

END.


