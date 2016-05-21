CXX = g++
CXX_STD = c++11
SRC = src
SRCS = $(wildcard $(SRC)/*.cpp)
INCLUDE = include

LDFLAGS = 
OBJ_DIR = obj

OBJECTS = $(addprefix $(OBJ_DIR)/, $(notdir $(SRCS:.cpp=.o)))

EXEC = frontend.a

CXXFLAGS = -W -Wall -Wextra -g -I$(INCLUDE) -std=$(CXX_STD)

all: $(OBJ_DIR) $(EXEC)

$(EXEC): $(OBJECTS)
	@ar -rs $@ $(OBJECTS)

# Implicit rule to compile c++ files
$(OBJ_DIR)/%.o: $(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	@rm -rf  *.o *~ \#* $(OBJ_DIR) $(EXEC)

clobber: clean

$(OBJ_DIR):
	@mkdir -p $@
