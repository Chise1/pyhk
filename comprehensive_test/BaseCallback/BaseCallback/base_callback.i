%module(package="base_callback") base_callback
%header %{
#include "base.h"
%}
%import  "/home/cs/Documents/pyhk/comprehensive_test//Base/base/base.i"
%import  "/home/cs/Documents/pyhk/comprehensive_test/BaseStruct/BaseStruct/struct.i"
%inline%{
struct CallbackOp {
	virtual int handle(POINTER x, POINTER y, VECTOR* vector_length)=0;
	virtual ~CallbackOp(){}
};
%}
%{
static CallbackOp* handler_ptr = NULL;
static int handler_helper(POINTER x, POINTER y, VECTOR* vector_length) {
    // Make the call up to the target language when handler_ptr
    // is an instance of a target language director class
    return handler_ptr->handle(x, y,vector_length);
}
%}
%inline%{
void  callback_get_result_wraper(POINTER x, POINTER y, CallbackOp* handler, VECTOR* vector_length){
handler_ptr = handler;
  callback_get_result(x, y, &handler_helper,vector_length);
  handler = NULL;
}
%}
// %include "base_callback.h"
// struct CallbackOp {
// 	virtual int handle(POINTER x, POINTER y, VECTOR* vector_length)=0;
// 	virtual ~CallbackOp(){}
// };
// int callback_get_result_wraper(POINTER x, POINTER y, CallbackOp* handler, VECTOR* vector_length);
