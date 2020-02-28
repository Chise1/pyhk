#include "t.h"
#include "stdio.h"
#include <string>
using namespace std;
int add(int *a, int *b)
{
    return *a + *b;
}

void mul(int a, int b, int *result)
{
    *result = a * b;
}
const char * str_add(char * a,char  *b ){
    string sa(a);
    string sb(b);
    string c=sa+sb;
    return c.c_str();
}