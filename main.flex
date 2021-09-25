%{

#include <iostream>
#include "cool-parse.h"

int lineno = 1; // first line

//ESAC = 270,
//DARROW = 272,
//TYPEID = 278,
//OBJECTID = 279,
//LET_STMT = 285

void print(char *thing) {
    std::cout << thing << std::endl;
}

%}

%x comment
%option noyywrap
%%

class           { print("class"); return CLASS; }
else            { print("else"); return ELSE; }
fi              { print("fi"); return FI; }
if              { print("if"); return IF; }
in              { print("in"); return IN; }
inherits        { print("inherits"); return INHERITS; }
let             { print("let"); return LET; }
loop            { print("loop"); return LOOP; }
pool            { print("pool"); return POOL; }
then            { print("then"); return THEN; }
while           { print("while"); return WHILE; }
case            { print("case"); return CASE; }
of              { print("of"); return OF; }
new             { print("new"); return NEW; }
isvoid          { print("isvoid"); return ISVOID; }
true            { print("bool_true"); return BOOL_CONST; }
false           { print("bool_false"); return BOOL_CONST; }
not             { print("not"); return NOT; }
le              { print("le"); return LE; }
=               { print("assign"); return ASSIGN; }


@               { print("at"); }
:               { print("colon"); }
\/              { print("divide"); }
\.              { print("dot"); }
[0-9]+          { print("int_const"); return INT_CONST; }
[0-9a-zA-Z]+    { print("str_const"); return STR_CONST; }

\(\*            { printf("begin comment\n"); BEGIN(comment); }
<comment>.      { printf("comment body\n"); }
<comment>\*\)   { printf("end comment\n"); BEGIN(INITIAL); }

[\t\r ]         {  print("tab space"); };
\n              { lineno++; };

.               { printf("Don't know this %s",yytext); return ERROR; }

%%

int main(int argc, char **argv) {
    yyin = stdin;

    // string constants should begin with " and end with "
    // the input should go from a file
    // remaining tokens have't been set

    yylex();
    return 0;
}