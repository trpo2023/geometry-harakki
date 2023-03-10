main: main.c main
	gcc -Wall -Werror -o run main.cpp && ./main && rm -f run
geometry: geometry.cpp geometry
	gcc -Wall -Werror -o run geometry.cpp && ./geometry && rm -f run