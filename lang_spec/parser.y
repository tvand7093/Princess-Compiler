
%{
#include <stdio.h>
int yylex();
int yyparse();
void yyerror(const char *s);
%}

%start start


%token 			VAR TRIVIA_SPACE
			LBRACE RBRACE END_STMT
			MEOW VAL IDENT
%%

start:		program;
		
program:	TRIVIA_SPACE method;

method:		VAR TRIVIA_SPACE IDENT TRIVIA_SPACE block
	;

block:		LBRACE statements RBRACE;

statements:	statements statement
	|	statement END_STMT;

statement:	print;
print:		MEOW '\"' VAL '\"';
		
%%

void yyerror (const char *s) {
    fprintf (stderr, "%s\n", s);
}
