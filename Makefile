# ПРОГРАММА

.PHONY: clean
.PHONY: test

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

#ТЕСТЫ

test: obj/src/geometry/geometry.o test/main.o thirdparty/ctest.h
	$(CC) $(LDFLAGS) main.c.o mytests.c.o -o test

test/geometry_test.o: test/geometry_test.c thirdparty/ctest.h
	$(CC) -c $(CFLAGS) $< $(CPPFLAGS) -o $@ -I thirdparty/ctest.h

test/main.o: test/main.c test/geometry_test.o thirdparty/ctest.h
	$(CC) -c $(CFLAGS) $< $(CPPFLAGS) -o $@ -I thirdparty/ctest.h

# ОЧИСТКА

clean: 
	rm bin/geometry
	rm obj/src/geometry/*.d
	rm obj/src/geometry/*.o
	rm obj/src/libgeometry/*.d
	rm obj/src/libgeometry/*.o
	rm obj/src/libgeometry/*.a

-include obj/src/geometry/geometry.d obj/src/libgeometry/calculate_circle.d
