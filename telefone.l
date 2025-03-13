%option noyywrap
DIGIT [0-9]
WHITESPACE [\t\n\r ]
PHONE_BR (\({DIGIT}{2}\) {DIGIT}{4,5}-{DIGIT}{4})|({DIGIT}{2} {DIGIT}{4,5}-{DIGIT}{4})|({DIGIT}{10,11})
%%
{PHONE_BR} {
    printf("Número de telefone válido: %s\n", yytext);
}
{WHITESPACE}+ /* Elimina espaços em branco */
. {
    printf("Caractere não reconhecido: %s\n", yytext);
}
%%
void main() {
    yylex();
}
