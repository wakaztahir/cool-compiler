%{

%}

%token SEMICOLON CLASS ELSE FI IF IN INHERITS LET LOOP POOL THEN WHILE CASE ESAC OF DARROW NEW ISVOID
%token STR_CONST INT_CONST BOOL_CONST TYPEID IDENTIFIER NOT LE LET_STMT
%token ASSIGN PLUS MINUS MULTIPLY DIVIDE LBRACE RBRACE
%token ERROR

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