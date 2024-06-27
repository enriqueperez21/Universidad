%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TAM 128
%}
%%

%%
// prototipo de funciones.
void encriptar(char frase[TAM], int key);
void desencriptar(char frase[TAM], int key);

void desencriptar(char frase[TAM], int key)
{
    int i = 0;
    while(frase[i]!='\0')
    {
        frase[i]=frase[i]-key;
        i++;
    }
    printf("\nLa frase desencriptada es:\n$s\n",frase);
}

void encriptar(char frase[TAM], int key)
{
    int i = 0;
    char letra;
    while(frase[i]!='\0')
    {
        frase[i]=frase[i]+key;
        i++;
    }
    printf("\nLa frase encriptada es:\n$s\n",frase);
}

int main()
{
    int x;
    char cadena[TAM];
    printf("introduce una cadena:   ");
    scanf("%128[^\n]", cadena);
    while(getchar()!='\n');
    encriptar(cadena,x);
    getchar();
    desencriptar(cadena,x);
    getchar();
    return 0;
}