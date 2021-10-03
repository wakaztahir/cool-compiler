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

%left MINUS
%left PLUS
%left MULTIPLY
%left DIVIDE

%%
prog:
    E
;

E:
    E PLUS E {
        printf("E OP E");
    }
    E MINUS E {
        printf("E MINUS E");
    }
    E MULTIPLY E {
        printf("E MULTIPLY E");
    }
    E DIVIDE E {
        printf("E DIVIDE E");
    }
    | LBRACE E RBRACE
    | INT_CONST
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