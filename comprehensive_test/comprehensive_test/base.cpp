#include "base.h"
#include <math.h>

void callback_get_result(POINTER x, POINTER y,callback fun,VECTOR *vector_length){
    //通过回调函数执行结果
    fun(x,y,vector_length);
}
void get_length(POINTER a,POINTER b,float *result){
*result=sqrt(pow(a.x-b.x,2)+pow(a.y-b.y,2));
}
BOOL test_init(){
    return TRUE;
}
