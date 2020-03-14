BIN = main
OBJS = 
CFLAGS = -g -Wall

all: $(OBJS)
	g++ ../src/$(BIN).cpp ../build/$? -o ../bin/$(BIN)

run:
	./../bin/$(BIN)

debug:
	g++ $(CFLAGS) ../src/* -o ../bin/$(BIN)

clean:
	rm ../bin/* *.o

%.o: ../src/%.cpp ../include/%.h
	g++ -c $< -o $@
