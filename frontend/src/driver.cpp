// $Id$
/** \file driver.cc Implementation of the example::Driver class. */

#include <fstream>
#include <sstream>
#include <iostream>
#include "LanguageContext.h"
#include "driver.h"
#include "scanner.h"

namespace PL {

Driver::Driver(class LanguageContext& _calc)
    : trace_scanning(false),
      trace_parsing(false),
      calc(_calc)
{
}

bool Driver::parse_stream(std::istream& in, const std::string& sname)
{
    streamname = sname;

    PrincessScanner scanner(&in);
    scanner.set_debug(trace_scanning);
    this->lexer = &scanner;

    PrincessParser parser(*this);
    parser.set_debug_level(trace_parsing);
    return (parser.parse() == 0);
}

bool Driver::parse_file(const std::string &filename)
{
    std::ifstream in(filename.c_str());
    if (!in.good()) return false;
    return parse_stream(in, filename);
}

bool Driver::parse_string(const std::string &input, const std::string& sname)
{
    std::istringstream iss(input);
    return parse_stream(iss, sname);
}

void Driver::error(const std::string& m)
{
    std::cerr << m << std::endl;
}

} // namespace example
