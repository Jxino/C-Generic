all:
	make list_test.exe
	make map_test.exe
	make graph.exe

clean:
	rm *.o
	rm *.exe

list.o: list.c list.h
	gcc -g -c list.c

map.o: map.c map.h list.h
	gcc -g -c map.c

list_test.exe: list_test.c list.o
	gcc -g list_test.c -o list_test.exe list.o

map_test.exe: map_test.c map.o list.o
	gcc -g map_test.c -o map_test.exe map.o list.o

graph.exe: graph.c list.o map.o
	gcc -g graph.c -o graph.exe list.o map.o
