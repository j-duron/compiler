%{
    #include <stdio.h>
    #include <string.h>
    #include "parser.tab.h"

// Function to remove quotes from strings
    void removeQuotes(char* str, char* new_str) {
        int len = strlen(str);

        strncpy(new_str, str + 1, len - 2);

        new_str[len - 2] = '\0';
    }
%}

%option noyywrap

/* Keyword definitions */

SEA                 (?i:sea)
CARACTER            (?i:car)
BOOLEANO            (?i:bool)
ENTERO              (?i:ent)
FLOTANTE            (?i:flot)
CADENA              (?i:cadena)
VACIO               (?i:vacio)
FUNCION             (?i:func)
CLASE               (?i:clase)
CIERTO              (?i:cierto)
FALSO               (?i:falso)
SI                  (?i:si)
SINO                (?i:sino)
Y                   (?i:y)
O                   (?i:o)
POR                 (?i:por)
MIENTRAS            (?i:mientras)
ESTA                (?i:esta)
EN                  (?i:en)
REGRESA             (?i:regresa)

/* Identifier definition */
IDENTIFIER          [a-zA-Z][a-zA-Z0-9_]*

/* Number constant definition */
INTEGER             [0-9]+
REAL                [0-9]+(\.[0-9]+)([eE][+-]?[0-9]+)?

/* String literal definitions */
CHARACTER           \'([^\n]|\\\n)\'
STRING              \"([^\n]|\\\n)*\"

/* Comment definitions */
SINGLE_LINE         \#[^*].*
MULTI_LINE          \#\*([^*]|\*+[^*#])*\*+\#

/* Whitespace definition */
WHITESPACE          [\ \f\r\n\t\v]+

%%

{SINGLE_LINE}       { /* Ignore comments */ }
{MULTI_LINE}        { /* Ignore comments */ }

{CHARACTER}         { yylval.character = yytext[1]; return CHARACTER; }
{STRING}            { yylval.string = yytext; return STRING; }

{SEA}               { yylval.string = yytext; return SEA; }
{CARACTER}          { yylval.string = yytext; return CARACTER; }
{BOOLEANO}          { yylval.string = yytext; return BOOLEANO; }
{ENTERO}            { yylval.string = yytext; return ENTERO; }
{FLOTANTE}          { yylval.string = yytext; return FLOTANTE; }
{CADENA}            { yylval.string = yytext; return CADENA; }
{VACIO}             { yylval.string = yytext; return VACIO; }
{FUNCION}           { yylval.string = yytext; return FUNCION; }
{CLASE}             { yylval.string = yytext; return CLASE; }
{CIERTO}            { yylval.string = yytext; return CIERTO; }
{FALSO}             { yylval.string = yytext; return FALSO; }
{SI}                { yylval.string = yytext; return SI; }
{SINO}              { yylval.string = yytext; return SINO; }
{Y}                 { yylval.string = yytext; return Y; }
{O}                 { yylval.string = yytext; return O; }
{POR}               { yylval.string = yytext; return POR; }
{MIENTRAS}          { yylval.string = yytext; return MIENTRAS; }
{ESTA}              { yylval.string = yytext; return ESTA; }
{EN}                { yylval.string = yytext; return EN; }
{REGRESA}           { yylval.string = yytext; return REGRESA; }

{INTEGER}           { yylval.integer = atoi(yytext); return INTEGER; }
{REAL}              { yylval.real = atof(yytext); return REAL; }

{WHITESPACE}        { /* Ignore whitespace */ }

"+"                 { return '+'; }
"-"                 { return '-'; }
"*"                 { return '*'; }
"/"                 { return '/'; }
"^"                 { return '^'; }
"%"                 { return '%'; }
"!"                 { return '!'; }
"+="                { return PLUS_EQUAL; }
"-="                { return MINUS_EQUAL; }
"*="                { return TIMES_EQUAL; }
"/="                { return DIVIDE_EQUAL; }
"%="                { return MOD_EQUAL; }
"="                 { return '='; }
"=="                { return EQUAL; }
"!="                { return NOT_EQUAL; }
"<"                 { return '<'; }
"<="                { return LE; }
">"                 { return '>'; }
">="                { return GE; }
"->"                { return ARROW; }
"("                 { return '('; }
")"                 { return ')'; }
"{"                 { return '{'; }
"}"                 { return '}'; }
"["                 { return '['; }
"]"                 { return ']'; }
";"                 { return ';'; }
","                 { return ','; }
"."                 { return '.'; }
"..."               { return ELLIPSIS; }
":"                 { return ':'; }

{IDENTIFIER}        { yylval.string = yytext; return IDENTIFIER; }

.                   { printf("Lexical error: unexpected character %s\n", yytext); }

%%