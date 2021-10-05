#include "stdio.h"

void usleep(__useconds_t us);
int atoi(const char *c);

int main(int argc, char **argv) {
  if (argc == 2) usleep(atoi(argv[1]));
  else if (argc == 1) return 0;
  else return 1;
}
