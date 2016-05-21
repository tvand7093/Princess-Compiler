
FRONTEND = frontend
TESTS = tests

FRONTEND_LIB = $(FRONTEND)/$(FRONTEND).a

all: $(FRONTEND_LIB)

test: $(FRONTEND_TESTS)

$(FRONTEND_TESTS):
	cd $(TESTS) && make

$(FRONTEND_LIB):
	cd $(FRONTEND) && make

clean: 
	rm -rf $(OUTPUT)

clobber: clean clobber-tests
	cd $(FRONTEND) && make clobber
	rm *~ \#*

clobber-tests:
	cd $(TESTS) && make clobber
