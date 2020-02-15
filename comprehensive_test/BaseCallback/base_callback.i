#pragma once
%module(package="base_callback") base_callback
%header %{
#include "base.h"
%}
struct CallbackOp {
	virtual int handle(POINTER x, POINTER y, VECTOR* vector_length)=0;
	virtual ~CallbackOp(){}
};
int callback_get_result_wraper(POINTER x, POINTER y, CallbackOp* handler, VECTOR* vector_length);