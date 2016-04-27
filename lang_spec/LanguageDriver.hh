#ifndef LANGUAGE_DRIVER_HH
#define LANGUAGE_DRIVER_HH

#include <string>
#include <map>

#include "LanguageParser.tab.hh"

#define YY_DECL yy::LanguageParser::symbol_type yylex (LanguageDriver& driver);

YY_DECL;

class LanguageDriver
{
public:
  LanguageDriver ();
  virtual ~LanguageDriver ();

  std::map<std::string, int> variables;

  int result;

  // Handling the scanner.
  void scan_begin ();
  void scan_end ();
  bool trace_scanning;
  
  // Run the parser on file F.
  // Return 0 on success.
  int parse (const std::string& f);
  // The name of the file being parsed.
  // Used later to pass the file name to the location tracker.
  std::string file;
  // Whether parser traces should be generated.
  bool trace_parsing;
  
  // Error handling.
  void error (const yy::location& l, const std::string& m);
  void error (const std::string& m);
};

#endif // ! LANGUAGE_DRIVER_HH
