CXX = g++
LEX = flex
YACC = bison

CXXFLAGS = -W -Wall -Wextra -ansi -g -emit-llvm
LDFLAGS = 

HEADERS = driver.h parser.h scanner.h expression.h \
    y.tab.h PrincessFlexLexer.h location.hh position.hh stack.hh

all: princess

# Generate scanner and parser

parser.cpp: parser.yy
	$(YACC) -o parser.cpp --defines=parser.h parser.yy

scanner.cpp: scanner.ll
	$(LEX) -o scanner.cpp scanner.ll

# Implicit rule to compile c++ files

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Link executable

princess: princess.o parser.o scanner.o driver.o
	$(CXX) $(LDFLAGS) -o $@ princess.o parser.o scanner.o driver.o

clean:
	rm -f princess *.o *~ \#*

clobber: clean
	rm -f parser.cpp parser.h scanner.cpp
