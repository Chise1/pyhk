%module(package="test") test
%header %{
    #include "test.h"
%}
%include "test.h"
%feature("autodoc","add(int a, int b)->int") add;