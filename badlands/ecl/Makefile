#
# author: KDr2
#
ECL_HOME ?= $(HOME)/programs/ecl
ECL = $(ECL_HOME)/bin/ecl

all: ecl-cmd

ecl-cmd: ecl-cmd.lisp
	$(ECL) -load build.lisp

clean:
	-rm -f *.fas
	-rm -f *.o *.so
	-rm -f *.exe
