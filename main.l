%{

#include <stdlib.h>
#include <math.h>

int lineno = 1; // first line

FILE * outfile;

void my_print(char *token_type) {
    fprintf(outfile,"%d\n%s\n", lineno, token_type);
}

//at case class colon comma divide dot else equals esac false fi
//identifier if in inherits integer isvoid larrow lbrace le let loop
//lparen lt minus new not of plus pool rarrow rbrace rparen semi tring
//then tilde times true type while

%}

%x comment

%%

@   { my_print("at"); }
case    { my_print("case"); }
class   { my_print("class"); }
:   { my_print("colon"); }
\/  { my_print("divide"); }
\.  { my_print("dot"); }
[0-9]+  { fprintf(outfile,"%d\ninteger\n%s\n",lineno,yytext); }
\(\*    { fprintf(outfile,"begin comment\n"); BEGIN(comment); }
<comment>. { fprintf(outfile,"comment body\n"); }
<comment>\*\)   { fprintf(outfile,"end comment\n"); BEGIN(INITIAL); }

[\t\r ]     {   };
\n  { lineno++; };

.   { my_print("No"); }

%%

int main(int argc, char **argv) {
    yyin = fopen(argv[1],"r");

    char * outfilename = (char*)malloc(strlen(argv[1]+4));

    sprintf(outfilename, "%s-lex",argv[1]);

    outfile = fopen("something.cl-lex","w");

    yylex();
}