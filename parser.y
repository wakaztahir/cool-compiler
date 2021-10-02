%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%token SEMICOLON CLASS ELSE FI IF IN INHERITS LET LOOP POOL THEN WHILE CASE ESAC OF DARROW NEW ISVOID
%token STR_CONST INT_CONST BOOL_CONST TYPEID IDENTIFIER NOT LE LET_STMT
%token ASSIGN PLUS MINUS MULTIPLY DIVIDE LBRACE RBRACE
%token ERROR

%type <string> STR_CONST

%union {
    char *string;
}

%%
prog:
    E
;

E:
    INT_CONST {
        printf("SINGLE INT_CONST");
    }
    | INT_CONST OP INT_CONST {
        printf("INT_CONST OP INT_CONST");
    }
    | LBRACE E RBRACE {
        printf("(E)");
    }
    | E OP E
;
OP:
    PLUS
    | MINUS
    | DIVIDE
    | MULTIPLY
;

%%

int yyerror(char *s)
{

  extern int yylineno;	// defined and maintained in lex.c

  printf("ERROR %s on line %d \n",s,yylineno);

  return 0;
}

int main()
{
    yyparse();
    return 0;
}