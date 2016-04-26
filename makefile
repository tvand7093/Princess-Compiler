
SRC = src
INTERMEDIATE = build
OUTDIR = bin
LANGUAGE = lang_spec

all: outdir princess

princess: parser tokenizer
	g++ -o $(OUTDIR)/$@  $(INTERMEDIATE)/parser.cpp $(INTERMEDIATE)/tokenizer.cpp $(SRC)/main.cpp

tokenizer: $(LANGUAGE)/tokenizer.l
	lex -o $(INTERMEDIATE)/$@.cpp $(LANGUAGE)/$@.l

parser:  $(LANGUAGE)/parser.y
	bison -v -d -o $(INTERMEDIATE)/$@.cpp $(LANGUAGE)/$@.y

outdir:
	mkdir -p $(OUTDIR)
	mkdir -p $(INTERMEDIATE)

clean:
	@rm -rf $(OUTDIR) $(INTERMEDIATE)
	@rm -f *~ *#
