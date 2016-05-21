
#ifndef PRINCESS_PARSER_H
#define PRINCESS_PARSER_H

#include "driver.h"

namespace PL {

/** Scanner is a derived class to add some extra function to the scanner
 * class. Flex itself creates a class named yyFlexLexer, which is renamed using
 * macros to ExampleFlexLexer. However we change the context of the generated
 * yylex() function to be contained within the Scanner class. This is required
 * because the yylex() defined in ExampleFlexLexer has no parameters. */
class PrincessParser
{
    private:
        Driver _driver;
		bool isDebug;
public:
    PrincessParser(Driver &driver) : _driver{driver} {};
	inline void set_debug_level(const bool debug) { isDebug = debug; }
	int parse();
};

} // namespace example

#endif // PRINCESS_SCANNER_H
