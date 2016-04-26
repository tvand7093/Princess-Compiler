
SRC = src
INTERMEDIATE = temp
OUTDIR = bin
LANGUAGE = lang_spec

IGNORE_WARNS = -Wno-deprecated-register -Wno-unneeded-internal-declaration -Wno-unused-function
OPTS = -std=c++14 -Wall -pedantic $(IGNORE_WARNS)
MODE = -D
FILES = $(INTERMEDIATE)/parser.cpp $(INTERMEDIATE)/tokenizer.cpp $(SRC)/main.cpp

all: outdir princess-debug clean-temp

debug: princess-debug
release: princess-release

princess-release: parser tokenizer
	g++ $(OPTS) $(FILES) $(MODE)RELEASE -o $(OUTDIR)/princess

princess-debug: parser tokenizer
	g++ $(OPTS) $(FILES) $(MODE)DEBUG -o $(OUTDIR)/princess

tokenizer: $(LANGUAGE)/tokenizer.l
	lex -o $(INTERMEDIATE)/$@.cpp $(LANGUAGE)/$@.l

parser:  $(LANGUAGE)/parser.y
	bison -v -d -o $(INTERMEDIATE)/$@.cpp $(LANGUAGE)/$@.y

outdir:
	mkdir -p $(OUTDIR)
	mkdir -p $(INTERMEDIATE)

clean: clean-temp
	@rm -rf $(OUTDIR) $(INTERMEDIATE)
	@rm -f *~ *#

clean-temp:
	@rm -rf $(INTERMEDIATE)
