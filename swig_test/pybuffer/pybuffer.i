%module pybuffer
%include "pybuffer.i"
%feature("need study");
%pybuffer_mutable_binarry(char * str,unsigned int size );
// int snprintf(char *str,unsigned int size ,const char * format);