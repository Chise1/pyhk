%module dll_one
%header %{
    #include "dll_one.h"
%}
void  modify_dll_two_dll(int  a,TEST_STRUCT *s);
void test();