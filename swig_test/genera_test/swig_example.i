/* File: example.i */
%module swig_example

%{
#define SWIG_FILE_WITH_INIT
#include "swig_example.h"
#include "string.h"
#include <stdio.h>
%}
struct TestPoint{
    int x;
    int y;
};
int fact(int n);
// void *get_point_buffer();
void pointer2struct(void *st,void *pointer,int l);
%include "cdata.i"
void *memcpy(void*dest, const void *src, unsigned int n);
void *get_void_pointer();
%include "cmalloc.i"
%constant int sizeof_TestPoint=sizeof(TestPoint);