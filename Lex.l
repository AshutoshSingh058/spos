// Compilation & Execution
// Compile using:
// lex expr.l
// yacc -d expr.y
// gcc lex.yy.c y.tab.c -o infix -ll -ly
// (On some systems use -lfl instead of -ll)

// Run the program:
// ./infix

// valid inputs
// a+b
// (a+b)*(c-d)
// x^y^z
// a+b*c-d/e
// invalid inputs
// a++b
// (a+b
// a*)


%{
#include "y.tab.h"
%}

%option noyywrap

%%

[ \t\n]+                ;               // Ignore spaces, tabs, newlines
[0-9]+                  { return NUMBER; }
[a-zA-Z][a-zA-Z0-9]*    { return ID; }
"("                     { return '('; }
")"                     { return ')'; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"^"                     { return '^'; }

.                       { return yytext[0]; }

%%
