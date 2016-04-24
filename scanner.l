
%{
#include <stdio.h>
#include "grammar.tab.h"
#include <string.h>
%}

%%

[a-z0-9]+ {
    if(strcmp("meow", yytext) == 0){
	return MEOW;
    }

    printf("%s\n", yytext);
    return VALUE;
}

[ \t\n]+

%%

int yywrap() {
    return 0;
}
