
FRONTEND = frontend
ROOT = $(shell pwd)
OUTPUT = bin
SYSTEM = $(shell uname -s)
DEP-INSTALL = ''

ifeq ($(SYSTEM),Linux)
	DEP-INSTALL = sudo apt-get install bison flex
endif
ifeq ($(SYSTEM),Darwin)
	DEP-INSTALL = brew install bison flex
endif

all: bin frontend

frontend: princess
	mv $(FRONTEND)/princess $(OUTPUT)/princess

princess:
	cd $(FRONTEND) && make all && cd $(ROOT)

install-deps:
	$(DEP-INSTALL)
	echo **** BISON VERSION **** $(bison --version)
	echo **** FLEX VERSION **** $(flex --version)

bin:
	@mkdir $(OUTPUT)

clean: clobber

clobber:
	rm -rf $(OUTPUT)
	cd $(FRONTEND) && make clobber && cd $(ROOT)
