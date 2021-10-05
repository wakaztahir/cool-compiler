%{
#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%token SEMICOLON CLASS ELSE FI IF IN INHERITS LET LOOP POOL THEN WHILE CASE ESAC OF DARROW NEW ISVOID
%token STR_CONST INT_CONST BOOL_CONST TYPEID IDENTIFIER NOT LE LET_STMT
%token ASSIGN PLUS MINUS MULTIPLY DIVIDE POWER LBRACE RBRACE
%token ERROR

%type <string> STR_CONST

%union {
    char *string;
}

%left MINUS
%left PLUS
%left MULTIPLY
%left DIVIDE

%start E
%%

E:
    INT_CONST {
         printf("INT_CONST");
    }
    | E PLUS E {
        printf("E PLUS E");
    }
    | E MULTIPLY E {
        printf("E MULTIPLY E");
    }
    | E MINUS E {
        printf("E MINUS E");
    }
    | E DIVIDE E {
        printf("E DIVIDE E");
    }
    | E POWER E {
       printf("E POWER E");
    }
    | LBRACE E RBRACE {
         printf("LBRACE E RBRACE");
    }
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