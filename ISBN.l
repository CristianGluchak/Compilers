%option noyywrap
DIGIT [0-9]
WHITESPACE [\t\n\r ]
ISBN10  ({DIGIT}{9}[0-9X])
ISBN13  (978|979)-{DIGIT}{1,5}-{DIGIT}{1,7}-{DIGIT}{1.6}-{DIGIT}
%%
{ISBN10} {
    printf("ISBN-10 válido: %s\n", yytext);
}
{ISBN13} {
    printf("ISBN-13 válido: %s\n", yytext);
}
{WHITESPACE}+ /* Elimina espaços em branco */
. {
    printf("Caractere não reconhecido: %s\n", yytext);
}
%%
void main() {
    yylex();
}
