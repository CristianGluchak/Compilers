%option noyywrap
DIGIT [0-9]
DIGITTO255 (25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])
WHITESPACE [\t\n\r ]
RESERVEDIPS (0\.0\.0\.0|255\.255\.255\.255)
VALIDIP  ({DIGITTO255}\.){3}(25[0-5]|2[0-4][0-9]|[1]?[0-9][0-9]?)
%%
{RESERVEDIPS} {
    printf("Endereço de IP reservado: %s\n", yytext);
}

{VALIDIP} {
    printf("Endereço de IP válido: %s\n", yytext);
}

{WHITESPACE}+ /* Elimina espaços em branco */
. {
    printf("Caractere não reconhecido: %s\n", yytext);
}
%%
void main() {
    yylex();
}
