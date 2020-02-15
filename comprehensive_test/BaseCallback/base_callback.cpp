#include "base_callback.h"
int callback_get_result_wraper(POINTER x, POINTER y, CallbackOp* handler, VECTOR* vector_length) {
    handler_ptr = handler;
    callback_get_result(x, y, &handler_helper, vector_length);
    handler = NULL;
}