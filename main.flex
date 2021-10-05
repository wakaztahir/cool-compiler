%{

#include "parser.tab.h"

int lineno = 1; // first line

void print(char *thing) {
    printf(thing);
}

char string_buf[20];
char *string_buf_ptr;

%}

%option noyywrap
%x comment
%x str

ID                  [a-z][a-z0-9]*

%%

class               { print("class"); return CLASS; }
else                { print("else"); return ELSE; }
fi                  { print("fi"); return FI; }
if                  { print("if"); return IF; }
in                  { print("in"); return IN; }
inherits            { print("inherits"); return INHERITS; }
let                 { print("let"); return LET; }
loop                { print("loop"); return LOOP; }
pool                { print("pool"); return POOL; }
then                { print("then"); return THEN; }
while               { print("while"); return WHILE; }
case                { print("case"); return CASE; }
of                  { print("of"); return OF; }
new                 { print("new"); return NEW; }
isvoid              { print("isvoid"); return ISVOID; }
true                { print("bool_true"); return BOOL_CONST; }
false               { print("bool_false"); return BOOL_CONST; }
not                 { print("not"); return NOT; }
le                  { print("le"); return LE; }
"("                 { return LBRACE; }
")"                 { return RBRACE; }
";"                 { print("Semicolon"); return SEMICOLON; }
=                   { print("assign"); return ASSIGN; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
"**"                { print("power"); return POWER; }
"*"                 { print("multiply"); return MULTIPLY; }
\/                  { return DIVIDE; }

\"                  string_buf_ptr = string_buf; BEGIN(str);

<str>\"             { /* saw closing quote - all done */
                        BEGIN(INITIAL);
                        print("you typed string");
                        *string_buf_ptr = '\0';
                        /* return string constant token type and
                         * value to parser
                         */
                    }

<str>\n            {
                    /* error - unterminated string constant */
                    /* generate error message */
                    }

<str>\\[0-7]{1,3}   {
                            /* octal escape sequence */
                        int result;

                        (void) sscanf( yytext + 1, "%o", &result );

                        if ( result > 0xff )
                                /* error, constant is out-of-bounds */

                        *string_buf_ptr++ = result;
                    }

<str>\\[0-9]+       {
                        /* generate error - bad escape sequence; something
                         * like '\48' or '\0777777'
                         */
                    }

<str>\\n            *string_buf_ptr++ = '\n';
<str>\\t            *string_buf_ptr++ = '\t';
<str>\\r            *string_buf_ptr++ = '\r';
<str>\\b            *string_buf_ptr++ = '\b';
<str>\\f            *string_buf_ptr++ = '\f';

<str>\\(.|\n)       *string_buf_ptr++ = yytext[1];

<str>[^\\\n\"]+     {
                        char *yptr = yytext;

                        while ( *yptr )
                            *string_buf_ptr++ = *yptr++;
                    }

@                   { print("at"); }
:                   { print("colon"); }
\.                  { print("dot"); }
[0-9]+              { return INT_CONST; }
{ID}                { print("identifier"); return IDENTIFIER; }
\(\*                { printf("begin comment\n"); BEGIN(comment); }
<comment>.          { printf("comment body\n"); }
<comment>\*\)       { printf("end comment\n"); BEGIN(INITIAL); }

[\t\r ]             {  };
\n                  { yylineno++; };

.                   { printf("Don't know this %s",yytext); return ERROR; }

%%