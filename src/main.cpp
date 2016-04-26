#include <iostream>
#include <errno.h>
#include <stdio.h>

extern int yyparse();
extern int yylex();
extern FILE* yyin;

int file_num = 0;
int file_num_max = 0;
char** files;

int yywrap() {
  fclose(yyin);
  if (++file_num < file_num_max) {
    if ((yyin = fopen(files[file_num], "r")) == 0) {
      perror(files[file_num]);
      exit(1);
    }
    return 0;
  } else {
    return 1;
  }
}


int main (int argc, char **argv){
  file_num_max = argc;
  files = argv;
  
  if (argc > 1) {
    if ((yyin = fopen(argv[file_num], "r")) == 0 ) {
      perror(argv[file_num]);
      exit(1);
    }
  }

  while(yylex());
  
  return 0;
}
