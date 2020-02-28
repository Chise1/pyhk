%module(package="pyhk",directors="1") pyhk
%feature("autodoc","2");
%{
    #include "HCNetSDK.h"
    #include "py_hk.h"
%}
%include "py_hk.h"