%module dll_two
%header %{
    #include "dll_one.h"
%}
struct TEST_STRUCT{
    int a;
    int b;
};
void test();