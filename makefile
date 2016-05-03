
FRONTEND = frontend
TESTS = tests
ROOT = $(shell pwd)
OUTPUT = bin
SYSTEM = $(shell uname -s)
DEP-INSTALL = ''

ifeq ($(SYSTEM),Linux)
	DEP-INSTALL = sudo apt-get install flex bison=3.0.4
endif
ifeq ($(SYSTEM),Darwin)
	DEP-INSTALL = brew update && brew install bison flex && brew link bison --force
endif

all: bin frontend

test: $(FRONTEND)-$(TESTS)
	./$(OUTPUT)/$(FRONTEND)-$(TESTS)


$(FRONTEND)-$(TESTS): bin
	cd $(TESTS) && make
	mv $(TESTS)/$(OUTPUT)/$@ $(OUTPUT)/$@

frontend: princess
	mv $(FRONTEND)/$^ $(OUTPUT)/$@

princess:
	cd $(FRONTEND) && make all && cd $(ROOT)

install-deps:
	$(DEP-INSTALL)

bin:
	@mkdir $(OUTPUT)

clean: 
	rm -rf $(OUTPUT)

clobber: clean clobber-tests
	cd $(FRONTEND) && make clobber
	rm *~ \#*

clobber-tests:
	cd $(TESTS) && make clobber
