package yal.analyse ;

import java_cup.runtime.*;
import yal.exceptions.AnalyseLexicaleException;
      
%%
   
%class AnalyseurLexical
%public

%line
%column
    
%type Symbol
%eofval{
        return symbol(CodesLexicaux.EOF) ;
%eofval}

%cup

%{

  private StringBuilder chaine ;

  private Symbol symbol(int type) {
	return new Symbol(type, yyline, yycolumn) ;
  }

  private Symbol symbol(int type, Object value) {
	return new Symbol(type, yyline, yycolumn, value) ;
  }
%}

idf = [A-Za-z_][A-Za-z_0-9]*

csteE = [0-9]+

finDeLigne = \r|\n
comment = \/\/.*{finDeLigne}
espace = {finDeLigne}  | [ \t\f] | {comment}


%%

"programme"            { return symbol(CodesLexicaux.PROGRAMME); }
"debut"                { return symbol(CodesLexicaux.DEBUT); }
"fin"              	   { return symbol(CodesLexicaux.FIN); }

"entier"               { return symbol(CodesLexicaux.TYPE); }

"="                    { return symbol(CodesLexicaux.EQUAL); }

"ecrire"               { return symbol(CodesLexicaux.ECRIRE); }

"lire"                 { return symbol(CodesLexicaux.LIRE); }

"tantque"              { return symbol(CodesLexicaux.TANTQUE); }

"repeter"              { return symbol(CodesLexicaux.REPETER); }

"fintantque"           { return symbol(CodesLexicaux.FINTANTQUE); }

"si"                   { return symbol(CodesLexicaux.SI); }

"alors"                { return symbol(CodesLexicaux.ALORS); }

"sinon"                { return symbol(CodesLexicaux.SINON); }

"finsi"                { return symbol(CodesLexicaux.FINSI); }

";"                    { return symbol(CodesLexicaux.POINTVIRGULE); }

{csteE}      	       { return symbol(CodesLexicaux.CSTENTIERE, yytext()); }

{idf}      	           { return symbol(CodesLexicaux.IDF, yytext()); }

{espace}               {  }

.                      { throw new AnalyseLexicaleException(yyline, yycolumn, yytext()) ; }

