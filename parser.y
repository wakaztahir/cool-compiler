%{

#include <iostream>

%}

%token STRING NUM OTHER SEMICOLON PIC

%type <name> STRING
%type <number> NUM
%type <name> PIC

%union {
	char name[20];
	int number;
}

%%
prog:
  stmts
;

stmts:
	| stmt SEMICOLON stmts
stmt:
	STRING{
		std::cout << "Hello to you too";
	}
	| NUM {
		std::cout << "That is a number";
	}
	| OTHER
;

%%

%%