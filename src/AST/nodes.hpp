#include <string>

namespace PL {
  namespace AST {
    typedef struct _ScannerContext {
      std::string *file;
      int token;
      std::string *str;
    } ScannerContext;
  }
}
