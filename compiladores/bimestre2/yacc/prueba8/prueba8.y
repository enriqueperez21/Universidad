%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *s);
int yylex();
int bin_to_dec(int bin);
int bin_to_oct(int bin);
void bin_to_hex(int bin, char* hex_str);
%}

%token ZERO ONE

%%
N: L {
      int decimal = $1;
      char hex_str[20];
      printf("\n EQUIVALENTES:");
      printf("\n Decimal: %d", decimal);
      printf("\n Octal: %o", decimal);
      bin_to_hex(decimal, hex_str);
      printf("\n Hexadecimal: %s\n", hex_str);
   }
;

L: L B { $$ = $1 * 2 + $2; }
 | B   { $$ = $1; }
;

B: ZERO { $$ = 0; }
 | ONE  { $$ = 1; }
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

int bin_to_dec(int bin)
{
    return bin;
}

int bin_to_oct(int bin)
{
    return bin;
}

void bin_to_hex(int bin, char* hex_str)
{
    sprintf(hex_str, "%X", bin);
}