%module test_void
%feature("test void *");
%header %{
    #include "test_void.h"
%}
%include "test_void.h"

