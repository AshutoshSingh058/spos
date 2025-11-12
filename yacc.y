
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token ID NUMBER

%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS

%%
input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expr '\n'     { printf("Valid Infix Expression\n"); }
    | error '\n'    { printf("Invalid Infix Expression\n"); yyerrok; }
    ;

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | expr '^' expr
    | '(' expr ')'
    | '-' expr %prec UMINUS
    | ID
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    // printf("Error: %s\n", s);   // uncomment for debugging
}

int main() {
    printf("Enter an infix expression:\n");
    yyparse();
    return 0;
}
