CFLAGS += -m64 -Wall
PROGS := bpf-fancy dropper bpf-direct getppid

all: $(PROGS)

bpf-fancy: bpf-helper.o

clean:
	-rm -f $(PROGS) *.o

test: all
	@echo "Running bpf-direct"
	@echo "hello" | ./bpf-direct
	@echo $$?
	@echo "Running bpf-fancy, expect rc = 159"
	@-echo "hello" | ./bpf-fancy
	@echo $$?
	@echo "Running dropper, expect rc = -13"
	@./dropper 64 0xC0000015 13 ./getppid
