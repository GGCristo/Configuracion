BIN = main
TEST = $(wildcard ../test/*.cpp)
TESTBIN = $(patsubst ../test/%.cpp, ../bin/%, $(TEST))
SRC = $(wildcard ../src/*.cpp)
OBJS = $(patsubst ../src/%.cpp,%.o,$(SRC))
CFLAGS = -g -Wall

.PHONY: all
all: $(OBJS)
	g++ $? -o ../bin/$(BIN)

.PHONY: SFML
SFML: $(OBJS)
	g++ $? -o ../bin/$(BIN) -lsfml-graphics -lsfml-window -lsfml-system

.PHONY: run
run:
	./../bin/$(BIN)

.PHONY: debug
debug:
	g++ $(CFLAGS) ../src/* -o ../bin/$(BIN)

.PHONY: clean
clean:
	@rm ../bin/* *.o 2>/dev/null || true

.PHONY: test
test: $(TESTBIN)

../bin/%: ../test/%.cpp ../test/catch.hpp
	g++ $< -o $@

$(BIN).o: ../src/$(BIN).cpp
	g++ -c $< -o $@

%.o: ../src/%.cpp ../include/%.h
	g++ -c $< -o $@
