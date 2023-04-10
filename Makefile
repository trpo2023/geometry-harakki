#I DONT UNDERSTAND HOW TO MAKE IT WORKS!
CC = gcc
CFLAGS = -Wall -Wextra -I src/libgeometry
CPPFLAGS = -MMD
LDFLAGS = -lm

SRCDIR = src/geometry/
LIBDIR = src/libgeometry

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(patsubst $(SRCDIR)/%.c, $(SRCDIR)/%.o, $(SRC))

all: geometry

geometry: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBDIR)/calculate_circle.o

$(SRCDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c $(CFLAGS) -o $@ $<

$(LIBDIR)/calculate_circle.o: $(LIBDIR)/calculate_circle.o $(LIBDIR)/calculate_circle.h
	ar rsc $@ $^

$(LIBDIR)/calculate_circle.o: $(LIBDIR)/calculate_circle.c $(LIBDIR)/calculate_circle.h
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(LIBDIR)/calculate_circle.o geometry
