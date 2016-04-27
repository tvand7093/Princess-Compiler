#include "LanguageDriver.hh"
#include "LanguageParser.tab.hh"

LanguageDriver::LanguageDriver ()
  : trace_scanning (false), trace_parsing (false)
{
  variables["one"] = 1;
  variables["two"] = 2;
}

LanguageDriver::~LanguageDriver ()
{
}

int LanguageDriver::parse (const std::string &f)
{
  file = f;
  scan_begin ();
  yy::LanguageParser parser (*this);
  parser.set_debug_level (trace_parsing);
  int res = parser.parse ();
  scan_end ();
  return res;
}

void LanguageDriver::error (const yy::location& l, const std::string& m)
{
  std::cerr << l << ": " << m << std::endl;
}

void LanguageDriver::error (const std::string& m)
{
  std::cerr << m << std::endl;
}
