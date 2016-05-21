#include <iostream>
#include <fstream>

#include "driver.h"
#include "AST.h"


int main(int argc, char* argv[]){
  PL::LanguageContext ctx;
  PL::Driver driver(ctx);
  bool readfile = false;

  for(int ai = 1; ai < argc; ++ai)
    {
      if (argv[ai] == std::string ("-p")) {
	driver.trace_parsing = true;
      }
      else if (argv[ai] == std::string ("-s")) {
	driver.trace_scanning = true;
      }
      else
	{
	  // read a file with expressions

	  std::fstream infile(argv[ai]);
	  if (!infile.good())
	    {
	      std::cerr << "Could not open file: " << argv[ai] << std::endl;
	      return 0;
	    }

	  bool result = driver.parse_stream(infile, argv[ai]);
	 

	  readfile = true;
	}
    }

  if (readfile) return 0;

  std::cout << "Reading expressions from stdin" << std::endl;

  std::string line;
  while( std::cout << "input: " &&
	 std::getline(std::cin, line) &&
	 !line.empty() )
    {
      //ctx.clearExpressions();
      bool result = driver.parse_string(line, "input");

      if (result)
			{
				std::cout << "Valid input" << std::endl;
				// for (unsigned int ei = 0; ei < calc.expressions.size(); ++ei)
				//   {
				//     std::cout << "tree:" << std::endl;
				//     //calc.expressions[ei]->print(std::cout);
				//     std::cout << "evaluated: "
				// 	//<< calc.expressions[ei]->evaluate()
				// 	<< std::endl;
				//   }
			}
			else {
				std::cout << "Invalid input" << std::endl;
			}
    }

  return 0;
}
