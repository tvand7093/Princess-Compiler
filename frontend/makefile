CXX = g++
LEX = flex
YACC = bison

CXXFLAGS = -W -Wall -Wextra -ansi -g
LDFLAGS = 

OBJ = obj
OBJECTS = princess.o parser.o scanner.o driver.o

OUT_EXEC = frontend

HEADERS = driver.h parser.h scanner.h expression.h \
    y.tab.h PrincessFlexLexer.h location.hh position.hh stack.hh

all: $(OUT_EXEC) move-objs

move-objs: $(OBJ) $(OBJECTS)
	@mv *.o $(OBJ)/

# Generate scanner and parser
parser.cpp: parser.yy
	$(YACC) -o $@ --defines=parser.h $^ 

scanner.cpp: scanner.ll
	$(LEX) -o $@ $^

# Implicit rule to compile c++ files

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Link executable

$(OUT_EXEC): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^

clean:
	rm -f princess *.o *~ \#*

clobber: clean
	rm -f parser.cpp parser.h scanner.cpp

$(OBJ):
	@mkdir -p $@
