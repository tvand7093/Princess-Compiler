
FRONTEND = frontend
ROOT = $(shell pwd)
OUTPUT = bin

all: bin frontend

frontend: princess
	mv $(FRONTEND)/princess $(OUTPUT)/princess

princess:
	cd $(FRONTEND) && make all && cd $(ROOT)

bin:
	@mkdir $(OUTPUT)

clean: clobber

clobber:
	rm -rf $(OUTPUT)
	cd $(FRONTEND) && make clobber && cd $(ROOT)
