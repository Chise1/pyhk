#pragma once
#include "../comprehensive_test/dll/base.h"

struct CallbackOp {
	virtual int handle(POINTER x, POINTER y, VECTOR* vector_length)=0;
	virtual ~CallbackOp(){}
};
static CallbackOp* handler_ptr = NULL;
static int handler_helper(POINTER x, POINTER y, VECTOR* vector_length) {
    // Make the call up to the target language when handler_ptr
    // is an instance of a target language director class
    return handler_ptr->handle(x, y,vector_length);
}
int callback_get_result_wraper(POINTER x, POINTER y, CallbackOp* handler, VECTOR* vector_length);