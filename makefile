

all: bin frontend

frontend: princess
	mv src/princess bin/princess

princess:
	cd src && make all && cd ../

bin:
	@mkdir bin

clean: clobber

clobber:
	rm -rf bin
	cd src && make clobber
