#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(void)
{
	printf("getppid() returned %d\n", getppid());

	return 0;
}
