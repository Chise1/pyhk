%module t
%feature("autodoc","1");
%feature("autodoc","ceshizhushi ") add;
%header %{
    #include "t.h"
%}
%include "t.h"
// %include "typemaps.i"
//  int add(int * INPUT, int * INPUT);
//  void mul(int , int , int *OUTPUT);
//test simple_pointer
// %include "t2.i"
