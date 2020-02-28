#include "swig_example.h"
#include <stdio.h>
#include <iostream>
int fact(int n) {
  if (n < 0) { /* This should probably return an error, but this is simpler */
    return 0;
  }
  if (n == 0) {
    return 1;
  } else {
    /* testing for overflow would be a good idea here */
    return n * fact(n-1);
  }
}
// void *get_point_buffer(){
//   TestPoint xa;
//     TestPoint * a=&xa;
//     *a->x=5;
//     *a->y=4;
//     return (void *)a;
// }
void pointer2struct(void *st,void *pointer,int l){
  memcpy(st,pointer,l);
}
void *get_void_pointer(){
  void *x=NULL;
  return x;
}