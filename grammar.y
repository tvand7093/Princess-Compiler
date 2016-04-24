
%{
#include <stdio.h>
int yylex();
int yyparse();
void yyerror(const char *s);
%}

%start program

%token VALUE MEOW

%%

program : MEOW print
	|	"\n"
        ;
print:		VALUE program

		%%

int main(void){
    yyparse();
    return 0;
}
void yyerror (const char *s) {
    fprintf (stderr, "%s\n", s);
}
