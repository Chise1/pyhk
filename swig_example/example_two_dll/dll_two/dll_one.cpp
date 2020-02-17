#include "dll_one.h"
#include "iostream"
void modify_dll_two_dll(int a,TEST_STRUCT  * s){
   s->a=a;
}
void test(){
cout<<"version 1.0"<<endl;
}