CXX = g++
CXX_STD = c++11
SRC = src
SRCS = $(wildcard $(SRC)/*.cpp)
INCLUDE = include

LDFLAGS = 
OBJ_DIR = obj

OBJECTS = $(addprefix $(OBJ_DIR)/, $(notdir $(SRCS:.cpp=.o)))

EXEC = frontend

HEADERS = driver.h parser.h scanner.h

CXXFLAGS = -W -Wall -Wextra -g -I$(INCLUDE) -std=$(CXX_STD)

all: $(OBJ_DIR) $(EXEC)

$(EXEC): $(OBJECTS)
	ar rvs $@.a $(OBJECTS)
	
# Implicit rule to compile c++ files
$(OBJ_DIR)/%.o: $(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# Link executable

#$(EXEC): $(OBJECTS)
#	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

clean:
	rm -rf princess *.o *~ \#* $(OBJ_DIR)

$(OBJ_DIR):
	@mkdir -p $@
