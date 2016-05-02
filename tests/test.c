#include <stdio.h>

int some_function(int input)
{
  return input * 2;
}

int main()
{
  int answer = some_function(21);
  printf("Answer is %d\n", answer);
  return 0;
}
