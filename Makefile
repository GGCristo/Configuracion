BIN = main
SRC = $(wildcard ../src/*.cpp)
OBJS = $(patsubst ../src/%.cpp,%.o,$(SRC))
CFLAGS = -g -Wall

all: $(OBJS)
	g++ $? -o ../bin/$(BIN)

run:
	./../bin/$(BIN)

debug:
	g++ $(CFLAGS) ../src/* -o ../bin/$(BIN)

clean:
	rm ../bin/* *.o
	g++ -c $< -o $@
$(BIN).o: ../src/$(BIN).cpp
	g++ -c $< -o $@
%.o: ../src/%.cpp ../include/%.h
	g++ -c $< -o $@
