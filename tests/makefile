
GTEST_CLONE_DIR = gtest
GTEST_DIR = googletest
GTEST_BUILD = $(GTEST_CLONE_DIR)/$(GTEST_DIR)

BUILD = build
BIN = bin
TESTS = frontend-tests.cpp

OUTPUT = $(BIN)/frontend-tests


all: $(BIN) $(BUILD) google-test-clone $(OUTPUT)

$(OUTPUT): $(TESTS) $(BUILD)/libgtest.a
	g++ -isystem $(GTEST_BUILD) -pthread $^ -o $@

$(BUILD)/libgtest.a: $(GTEST_BUILD)/gtest-all.o
	ar -rv $@ $^

$(GTEST_BUILD)/gtest-all.o: $(GTEST_BUILD)/src/gtest-all.cc
	g++ -isystem $(GTEST_BUILD)/include -I$(GTEST_BUILD) -pthread -c $^ -o $@

google-test-clone:
	@if [ ! -d "$(GTEST_CLONE_DIR)" ]; then \
		git clone https://github.com/google/googletest $(GTEST_CLONE_DIR); \
	fi

clean:
	rm -rf $(BUILD) $(BIN)

build:
	@mkdir -p $(BUILD)

bin:
	@mkdir -p $(BIN)

clobber: clean
	rm -rf $(GTEST_CLONE_DIR) *~ \#*
