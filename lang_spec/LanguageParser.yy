
%{
#include <stdio.h>
#include <string>

void yyerror(const char *s);

%}
%skeleton "lalr1.cc" /* -*- C++ -*- */
%require "3.0.4"
%code requires
{
#include <string>
class LanguageDriver;
}
			
%defines
%define parser_class_name {LanguageParser}					    
%define api.token.constructor				
%define api.value.type variant
%define parse.assert
%define parse.trace
%define parse.error verbose
			
%param { LanguageDriver& driver }

%locations
%initial-action
{
    // Initialize the initial location.
    @$.begin.filename = @$.end.filename = &driver.file;
};
						

%code
{
    #include "LanguageDriver.hh"
}		       
			
%token	<int>		VAR LBRACE RBRACE
		        MEOW "integer"
			
%token	<std::string>	TRIVIA_SPACE END_STMT
			IDENT VAL "string"
						
%%
%start start;

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

void yy::LanguageParser::error (const location_type& l, const std::string& m)
{
    driver.error (l, m);
}
