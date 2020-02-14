#include "t.h"
int add(int *a, int *b)
{
    return *a + *b;
}

void mul(int a, int b, int *result)
{
    *result = a * b;
}