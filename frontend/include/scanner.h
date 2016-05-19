
#ifndef PRINCESS_SCANNER_H
#define PRINCESS_SCANNER_H

#include "parser.h"

namespace PL {

/** Scanner is a derived class to add some extra function to the scanner
 * class. Flex itself creates a class named yyFlexLexer, which is renamed using
 * macros to ExampleFlexLexer. However we change the context of the generated
 * yylex() function to be contained within the Scanner class. This is required
 * because the yylex() defined in ExampleFlexLexer has no parameters. */
class PrincessScanner
{
    private:
        std::istream *_inStream;
public:

    PrincessScanner(std::istream *in) : _inStream{in} {}
    
    void set_debug(const bool shouldDebug);
};

} // namespace example

#endif // PRINCESS_SCANNER_H
