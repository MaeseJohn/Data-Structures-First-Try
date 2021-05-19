CC=g++
OPTIONS= -g
DEBUG= #-D DEBUG
LIBDIR=lib
INCLUDEDIR=include
_OBJ= tporo.o tvectorporo.o tlistaporo.o tabbporo.o
OBJ = $(patsubst %,$(LIBDIR)/%,$(_OBJ))

tad: src/tad.cpp $(OBJ)
	$(CC) $(OPTIONS) $(DEBUG) -I$(INCLUDEDIR) src/tad.cpp $(OBJ) -o tad

test: src/carlostad/tabbporo/tad11.cpp $(OBJ)
	$(CC) $(OPTIONS) $(DEBUG) -I$(INCLUDEDIR) src/carlostad/tabbporo/tad11.cpp $(OBJ) -o tad

$(LIBDIR)/%.o : $(LIBDIR)/%.cpp $(INCLUDEDIR)/%.h
	$(CC) $(OPTIONS) $(DEBUG) -c -I$(INCLUDEDIR) -o $@ $<

clean:
	rm -f $(OBJ)
	rm -f tad