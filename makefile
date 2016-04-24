
all: outdir princess

princess: grammar scanner
	cc bin/grammar.tab.c bin/scanner.yy.c -o bin/$@

grammar: grammar.y
	yacc -v -d $@.y
	mv y.tab.c bin/$@.tab.c
	mv y.tab.h bin/$@.tab.h
	mv y.output bin/$@.output


scanner: scanner.l
	lex -o bin/$@.yy.c $@.l

outdir:
	mkdir -p bin

clean:
	@rm -rf bin
	@rm -f *~ *#
	@rm *.tab.c
	@rm .out
