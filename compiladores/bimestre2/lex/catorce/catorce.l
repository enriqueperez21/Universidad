%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
username { printf("%s", getenv("USER")); }
%%

int main(void) {
    yylex();
    return 0;
}