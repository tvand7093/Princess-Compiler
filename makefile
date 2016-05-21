
# Test folders and execs
TESTS = tests
TESTS_EXEC = frontend-tests

# Parser and lexer binary stuff
FRONTEND = frontend
FRONTEND_LIB = $(FRONTEND)/libFrontend.a
FRONTEND_TESTS = $(TESTS)/$(TESTS_EXEC)
FRONTEND_INCLUDE = $(FRONTEND)/include

# The complete end result
EXEC = princess
EXEC_MAIN = $(EXEC).cpp
EXEC_COMPILER = clang++ #g++
EXEC_STD = -std=c++11
EXEC_OPTS = -g -Wall -pedantic $(FRONTEND_LIB) -I$(FRONTEND_INCLUDE)

# Build everything EXCLUDING but tests.
all: $(EXEC)

# Build everything INCLUDING tests
test: $(FRONTEND_TESTS)

$(EXEC): $(FRONTEND_LIB) $(EXEC_MAIN)
	$(EXEC_COMPILER) $(EXEC_OPTS) $(EXEC_STD) $(EXEC_MAIN) -o $(EXEC)

# Build the test exe
$(FRONTEND_TESTS): $(FRONTEND_LIB)
	@cd $(TESTS) && make

# Build the frontend library 
$(FRONTEND_LIB):
	@cd $(FRONTEND) && make

# Clean up all temp files and object files for everything
clean: clean-tests
	@rm -rf $(EXEC) $(EXEC).dSYM
	@cd $(FRONTEND) && make clean
	
# Clean up temp files for tests. Leaves the Google Test repo in place
clean-tests:
	@cd $(TESTS) && make clean

# Clear everything, including the Google Test repo.
clobber: clean clobber-tests
	@cd $(FRONTEND) && make clobber
	@rm -rf *~ \#*

clobber-tests:
	@cd $(TESTS) && make clobber
