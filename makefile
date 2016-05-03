
FRONTEND = frontend
TESTS = tests
ROOT = $(shell pwd)
OUTPUT = bin
SYSTEM = $(shell uname -s)
DEP-INSTALL = ''

FRONTEND_EXEC = $(FRONTEND)/frontend


ifeq ($(SYSTEM),Linux)
	DEP-INSTALL = sudo apt-get install flex bison=3.0.4
endif
ifeq ($(SYSTEM),Darwin)
	DEP-INSTALL = brew update && brew install bison flex && brew link bison --force
endif

all: bin $(OUTPUT)/$(FRONTEND)

test: $(FRONTEND)-$(TESTS)

$(FRONTEND)-$(TESTS): bin
	cd $(TESTS) && make
	mv $(TESTS)/$(OUTPUT)/$@ $(OUTPUT)/$@

$(OUTPUT)/$(FRONTEND): $(FRONTEND_EXEC)
	mv $^ $@

$(FRONTEND_EXEC):
	cd $(FRONTEND) && make all

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
