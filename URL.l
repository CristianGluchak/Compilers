%option noyywrap
DIGIT [0-9]
WHITESPACE [\t\n\r ]
URL (https?|ftp)://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/[a-zA-Z0-9._%+-]*)*
%%
{URL} {
    printf("URL válida: %s\n", yytext);
}
{WHITESPACE}+ /* Elimina espaços em branco */
. {
    printf("Caractere não reconhecido: %s\n", yytext);
}
%%
void main() {
    yylex();
}
