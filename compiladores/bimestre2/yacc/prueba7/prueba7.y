%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *s);
int yylex();
%}
%token ZERO ONE
%%
N: L {printf("\n EL NUMERO EQUIVALENTE EN DECIMAL ES: %d\n", $$);}
;
L: L B {$$=$1*2+$2;}
| B {$$=$1;}
;
B: ZERO {$$=0;}
| ONE {$$=1;}
;
%%
int main()
{
    printf("\n INGRESE LA SECUENCIA BINARIA: ");
    while(yyparse());
}
void yyerror(char *s)
{
    fprintf(stdout, "\n%s", s);
}