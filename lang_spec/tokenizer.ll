
%{
#include <iostream>
#include <stdio.h>
#include <string.h>
#include "LanguageDriver.hh"
#include "LanguageParser.tab.hh"
#include "location.hh"

// Code run each time a pattern is matched.
#define YY_USER_ACTION  loc.columns (yyleng);
#define yywrap() 1

static yy::location loc;

extern FILE* yyin;
extern int yy_flex_debug;

#include "../src/AST/nodes.hpp"
typedef yy::LanguageParser::token token;

%}
		        				
%option noyywrap nounput batch debug noinput c++
			
%%

%{
  // Code run each time yylex is called.
  loc.step();
%}

"meow" return token::MEOW;
"{"  return token::LBRACE;
"}" return token::RBRACE;
"var" return token::VAR;
";" return token::END_STMT;

[\n]+ { yylineno++; loc.lines (yyleng); loc.step (); }

[a-zA-Z_][a-zA-Z0-9_]* {
    return token::IDENT;
}

[ \t\n]+ {
    return token::TRIVIA_SPACE;
}

. {
  std::cout << "Unknown token [line: " << yylineno << "] in [file:  " << "]" << std::endl; 
  yyterminate();
}

%%

void LanguageDriver::scan_begin ()
{
    yy_flex_debug = trace_scanning;
    if (file.empty () || file == "-")
	yyin = stdin;
    else if (!(yyin = fopen (file.c_str (), "r")))
	{
	    error ("cannot open " + file + ": " + strerror(errno));
	    exit (EXIT_FAILURE);
	}
}

void LanguageDriver::scan_end ()
{
    fclose (yyin);
}

