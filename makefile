
FRONTEND = frontend
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

frontend: princess
	mv $(FRONTEND)/princess $(OUTPUT)/princess

princess:
	cd $(FRONTEND) && make all && cd $(ROOT)

install-deps:
	$(DEP-INSTALL)

bin:
	@mkdir $(OUTPUT)

clean: clobber

clobber:
	rm -rf $(OUTPUT)
	cd $(FRONTEND) && make clobber && cd $(ROOT)
