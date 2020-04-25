# Makefile génerico si un cpp solo depende de su header, si un un cpp depende de varios headers habra que crear una regla especial para él.
BIN = main
TEST = $(wildcard ../test/*.cpp)
TESTBIN = $(patsubst ../test/%.cpp, ../bin/%, $(TEST))
SRC = $(wildcard ../src/*.cpp)
OBJS = $(patsubst ../src/%.cpp, %.o, $(SRC))
HEADER = #Escribe aquí el nombre de las clases con template
HEADER := $(patsubst %, ../include/%.hpp, $(HEADER))
CFLAGS = -g -pedantic-errors -Wall -Wextra  -std=c++17 -fsanitize=address -static-libasan

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
	g++ $(CFLAGS) ../src/* $(HEADER) -o ../bin/$(BIN)

.PHONY: clean
clean:
	@rm ../bin/* *.o 2>/dev/null || true

.PHONY: test
test: $(TESTBIN)

../bin/%: ../test/%.cpp ../test/catch.hpp
	g++ $< -o $@

#(NOMBRE).o ../src/(NOMBRE).cpp ../include/(NOMBRE).hpp ../include/.hpp
	#g++ -c $< -o $@
###################################################################


###################################################################

$(BIN).o: ../src/$(BIN).cpp $(HEADER)
	g++ -c $< -o $@

%.o: ../src/%.cpp ../include/%.hpp
	g++ -c $< -o $@
