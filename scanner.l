%{
    #include <stdio.h>
    #include <string.h>
    #include "parser.tab.h"
%}

%option noyywrap

/* Keyword definitions */

SEA                 (?i:sea)
CARACTER            (?i:car)
BOOLEANO            (?i:bool)
ENTERO              (?i:ent)
FLOTANTE            (?i:flot)
DOBLE               (?i:doble)
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
REAL                [0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?

/* String literal definitions */

CHARACTER           \'([^\n]|\\\n)\'
STRING              \"([^\n]|\\\n)*\"

/* Comment definitions */

SINGLE_LINE         \#[^*].*
MULTI_LINE          \#\*([^*]|\*+[^*#])*\*+\#

/* Whitespace definition */
WHITESPACE          [\ \f\r\n\t\v]+

%%

{SINGLE_LINE}       { }
{MULTI_LINE}        { }

{CHARACTER}         { printf("<Character, %s>\n", yytext); }
{STRING}            { printf("<String, %s>\n", yytext); }

{SEA}               { printf("<Keyword, \"%s\">\n", yytext); }
{CARACTER}          { printf("<Keyword, \"%s\">\n", yytext); }
{BOOLEANO}          { printf("<Keyword, \"%s\">\n", yytext); }
{ENTERO}            { printf("<Keyword, \"%s\">\n", yytext); }
{FLOTANTE}          { printf("<Keyword, \"%s\">\n", yytext); }
{DOBLE}             { printf("<Keyword, \"%s\">\n", yytext); }
{CADENA}            { printf("<Keyword, \"%s\">\n", yytext); }
{VACIO}             { printf("<Keyword, \"%s\">\n", yytext); }
{FUNCION}           { printf("<Keyword, \"%s\">\n", yytext); }
{CLASE}             { printf("<Keyword, \"%s\">\n", yytext); }
{CIERTO}            { printf("<Keyword, \"%s\">\n", yytext); }
{FALSO}             { printf("<Keyword, \"%s\">\n", yytext); }
{SI}                { printf("<Keyword, \"%s\">\n", yytext); }
{SINO}              { printf("<Keyword, \"%s\">\n", yytext); }
{Y}                 { printf("<Keyword, \"%s\">\n", yytext); }
{O}                 { printf("<Keyword, \"%s\">\n", yytext); }
{POR}               { printf("<Keyword, \"%s\">\n", yytext); }
{MIENTRAS}          { printf("<Keyword, \"%s\">\n", yytext); }
{ESTA}              { printf("<Keyword, \"%s\">\n", yytext); }
{EN}                { printf("<Keyword, \"%s\">\n", yytext); }
{REGRESA}           { printf("<Keyword, \"%s\">\n", yytext); }

{INTEGER}           { printf("<Integer, \"%s\">\n", yytext); }
{REAL}              { printf("<Real, \"%s\">\n", yytext); }

{WHITESPACE}        { }

{IDENTIFIER}        { printf("<Identifier, \"%s\">\n", yytext); }

"+"                 { printf("<Operator, \"%s\">\n", yytext); }
"-"                 { printf("<Operator, \"%s\">\n", yytext); }
"*"                 { printf("<Operator, \"%s\">\n", yytext); }
"/"                 { printf("<Operator, \"%s\">\n", yytext); }
"^"                 { printf("<Operator, \"%s\">\n", yytext); }
"%"                 { printf("<Operator, \"%s\">\n", yytext); }
"!"                 { printf("<Operator, \"%s\">\n", yytext); }
"+="                { printf("<Operator, \"%s\">\n", yytext); }
"-="                { printf("<Operator, \"%s\">\n", yytext); }
"*="                { printf("<Operator, \"%s\">\n", yytext); }
"/="                { printf("<Operator, \"%s\">\n", yytext); }
"%="                { printf("<Operator, \"%s\">\n", yytext); }
"="                 { printf("<Operator, \"%s\">\n", yytext); }
"=="                { printf("<Operator, \"%s\">\n", yytext); }
"!="                { printf("<Operator, \"%s\">\n", yytext); }
"<"                 { printf("<Operator, \"%s\">\n", yytext); }
"<="                { printf("<Operator, \"%s\">\n", yytext); }
">"                 { printf("<Operator, \"%s\">\n", yytext); }
">="                { printf("<Operator, \"%s\">\n", yytext); }
"->"                { printf("<Operator, \"%s\">\n", yytext); }
"("                 { printf("<Left Paren, \"%s\">\n", yytext); }
")"                 { printf("<Right Paren, \"%s\">\n", yytext); }
"{"                 { printf("<Left Brace, \"%s\">\n", yytext); }
"}"                 { printf("<Right Brace, \"%s\">\n", yytext); }
"["                 { printf("<Left Bracket, \"%s\">\n", yytext); }
"]"                 { printf("<Right Bracket, \"%s\">\n", yytext); }
";"                 { printf("<Semicolon, \"%s\">\n", yytext); }
","                 { printf("<Comma, \"%s\">\n", yytext); }
"."                 { printf("<Period, \"%s\">\n", yytext); }
"..."               { printf("<Ellipsis, \"%s\">\n", yytext); }
":"                 { printf("<Colon, \"%s\">\n", yytext); }

.                   { printf("Error: \"%s\"\n", yytext); return 1; }

%%