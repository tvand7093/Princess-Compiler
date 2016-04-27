#include <iostream>
#include <errno.h>
#include <stdio.h>
#include <dirent.h>
#include <vector>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include "LanguageDriver.hh"

extern FILE* yyin;

int file_num = 0;
int file_num_max = 0;
std::vector<std::string> *files;

// extern "C" int yywrap() {
//   //close the currently open file.
//   fclose(yyin);

//   //check if we are at the end of file list.
//   //if not, keep processing
//   if (++file_num < file_num_max) {
//     std::cout << "Processing file: " << files->at(file_num) << std::endl;
//     //process next file

//     const char* filename = files->at(file_num).c_str();
//     if ((yyin = fopen(filename, "r")) == 0) {
//       //no go, so show error
//       perror(filename);
//       exit(1);
//     }

//     //open worked correctly
//     return 0;
//   } else {
//     //didn't open anything.
//     return 1;
//   }
// }

// void processFiles(const char* nextDir) {
//   DIR *dir;
//   struct dirent *ent;
    
//   if ((dir = opendir (nextDir)) != NULL) {
//     /* print all the files and directories within directory */

//     std::vector<std::string> *fileList = new std::vector<std::string>();
    
//     while ((ent = readdir (dir)) != NULL) {
//       std::string currentDir(nextDir);
//       auto current = currentDir + "/" + ent->d_name;
      
//       if(ent->d_name[0] == '.') {
// 	continue;
//       }

//       struct stat path_stat;
      
//       if(stat(current.c_str(), &path_stat) != 0){
// 	perror("Error stating file");
// 	continue;
//       }
      
//       int isDir = S_ISDIR(path_stat.st_mode);

      
//       if(!isDir && strlen(ent->d_name) < 6){
// 	continue; //cannot be a .cats file
//       }
      
//       if(isDir != 0){
// 	processFiles(current.c_str());
//       }
//       else {
// 	if(current.substr(current.length() - 5, 5) == ".cats"){
// 	  //our kind of file, so use this.
// 	  fileList->push_back(ent->d_name);
// 	  file_num_max++;	
// 	}
//       }
      
//     }

//     closedir (dir);

//     files = fileList;
//   } else {
//     /* could not open directory */
//     perror ("Couldn't open the test directory. Make sure you are in the root of the project, and not in the bin folder.");
//   }
// }

int main (int argc, char **argv){

  //char* cwd = getcwd(NULL,0);
  
  //  processFiles(cwd);
  
  //keep processing files. This will
  //keep calling yywrap foreach arguement in argv.

  // if(file_num_max > 0){
  //   //setup first file for reading...

  //   yywrap();
  //   int token;
  //   while((token = yylex())!= 0){
  //     switch(token) {
  //     case token::MEOW: printf("MEOW\n"); break;
  //     case token::LBRACE: printf("LBRACE\n"); break;
  //     case token::RBRACE: printf("RBRACE\n"); break;
  //     case token::VAR: printf("VAR\n"); break;
  //     case token::END_STMT: printf("END_STMT\n"); break;
  // 	//      case token::IDENT: printf("IDENT: %s\n", yylval.str); break;
  //     case token::TRIVIA_SPACE: printf("TRIVIA\n"); break;
  //     default: printf("UNKNOWN\n"); break;
  //     }
  //   }
  // }

  // delete files;
  int res = 0;
  LanguageDriver driver;
  for (int i = 1; i < argc; ++i)
    if (argv[i] == std::string ("-p"))
      driver.trace_parsing = true;
    else if (argv[i] == std::string ("-s"))
      driver.trace_scanning = true;
    else if (!driver.parse (argv[i]))
      std::cout << driver.result << std::endl;
    else
      res = 1;
  return res;
}
