.PHONY: clean

CFLAGS = -Wall -Wextra -Werror
CPPFLAGS = -MMD

LIBPATH = obj/src/libgeometry

all: bin/geometry

bin/geometry: obj/src/geometry/geometry.o obj/src/libgeometry/libgeometry.a
	$(CC) $(CFLAGS) -o $@ $^

obj/src/libgeometry/libgeometry.a: obj/src/libgeometry/calculate_circle.o
	ar rcs $@ $^

obj/src/geometry/geometry.o: src/geometry/geometry.c
	$(CC) -c $(CFLAGS) $< $(CPPFLAGS) -o $@ -I src/libgeometry 

obj/src/libgeometry/calculate_circle.o: src/libgeometry/calculate_circle.c src/libgeometry/calculate_circle.h
	$(CC) -c $(CFLAGS) $< $(CPPFLAGS) -o $@ -I src/libgeometry

clean: 
	rm obj/src/lib/*.o
	rm obj/src/geometry/*.o
	rm bin/*
	rm obj/src/geometry/*.d
	rm obj/src/lib/*.d
	rm obj/src/lib/lib.a

-include obj/src/geometry/geometry.d obj/src/libgeometry/calculate_circle.d
