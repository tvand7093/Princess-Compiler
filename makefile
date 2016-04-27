
SRC = src
INTERMEDIATE = generated
OUTDIR = bin
LANGUAGE = lang_spec

IGNORE_WARNS = -Wno-deprecated-register -Wno-unneeded-internal-declaration -Wno-unused-function
INCLUDES = -I$(INTERMEDIATE) -I$(SRC) -I$(LANGUAGE)
OPTS = -std=c++14 -Wall -pedantic $(IGNORE_WARNS)
MODE = -D
FILES = $(LANGUAGE)/LanguageDriver.cpp $(INTERMEDIATE)/LanguageParser.tab.cc $(INTERMEDIATE)/lex.yy.cc $(LANGUAGE)/main.cpp

all: outdir princess-debug

debug: princess-debug
release: princess-release

princess-release: LanguageParser tokenizer  move-to-temp
	g++ $(INCLUDES) $(OPTS) $(FILES) $(MODE)RELEASE -o $(OUTDIR)/princess

princess-debug: LanguageParser tokenizer  move-to-temp
	g++ $(INCLUDES) $(OPTS) $(FILES) $(MODE)DEBUG -o $(OUTDIR)/princess

tokenizer: $(LANGUAGE)/tokenizer.ll
	flex -d  $(LANGUAGE)/$@.ll

LanguageParser:  $(LANGUAGE)/LanguageParser.yy
	bison -v -d $(LANGUAGE)/$@.yy

outdir:
	mkdir -p $(INTERMEDIATE)
	mkdir -p $(OUTDIR)

clean: clean-temp
	@rm -rf $(OUTDIR)
	@rm -f *~ *#

clean-temp:
	@rm -rf $(INTERMEDIATE)

move-to-temp:
	mv -f *.hh $(INTERMEDIATE)/
	mv -f *.cc $(INTERMEDIATE)/
	mv -f *.output $(INTERMEDIATE)/
