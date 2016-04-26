
%{
#include <stdio.h>
#include "parser.hpp"
#include <string.h>
%}

%%

"meow" { return MEOW; }
"{" { return LBRACE; }
"}" { return RBRACE; }
"var" { return VAR; }
";" { return END_STMT; }

[a-zA-Z_][a-zA-Z0-9_]* {
  return IDENT;
}

[ \t\n]+ { return TRIVIA_SPACE; }

. {
  printf("Unknown token!\n");
  yyterminate();
}

%%

int yywrap() {
    return 0;
}
