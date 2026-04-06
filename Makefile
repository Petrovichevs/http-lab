CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Wno-implicit-function-declaration

all: client

full: server client

server: server.c
	$(CC) $(CFLAGS) -o server server.c

client: client.c
	$(CC) $(CFLAGS) -o client client.c

clean:
	rm -f server client *.o

test:
	@echo "=== Client Tests ==="
	@echo "Test label 0:"
	./client 192.168.100.10 8080 0 mysecret123 || echo "Error connecting to server"
	@echo "-------------------"
	@echo "Test label 1:"
	./client 192.168.100.10 8080 1 mysecret123 || echo "Error connecting to server"

run-server:
	./server

help:
	@echo "=== Available commands ==="
	@echo "  make              --> build only client"
	@echo "  make full         --> build server + client"
	@echo "  make clean        --> remove binaries"
	@echo "  make test         --> run client tests"
	@echo "  make run-server   --> start the server"
