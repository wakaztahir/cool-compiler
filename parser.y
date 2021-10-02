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
  stmts
;

stmts:
	| stmt SEMICOLON stmts
stmt:
	STR_CONST {
		printf("String");
	}
	| INT_CONST {
		printf("This is a number");
	}
	| ERROR
;

%%

int yyerror(char *s)
{

  extern int yylineno;	// defined and maintained in lex.c

  printf("ERROR %s at symbol on line %d \n",s,yylineno);

  return 0;
}

int main()
{
    yyparse();
    return 0;
}