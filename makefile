
FRONTEND = frontend
ROOT = $(shell pwd)
OUTPUT = bin
SYSTEM = $(shell uname -s)

all: bin frontend

frontend: princess
	mv $(FRONTEND)/princess $(OUTPUT)/princess

princess:
	cd $(FRONTEND) && make all && cd $(ROOT)

install-deps:
	ifeq ($(SYSTEM),Linux)
		apt-get install bison flex
	endif
	ifeq ($(SYSTEM),Darwin)
		brew install bison flex
	endif

bin:
	@mkdir $(OUTPUT)

clean: clobber

clobber:
	rm -rf $(OUTPUT)
	cd $(FRONTEND) && make clobber && cd $(ROOT)
